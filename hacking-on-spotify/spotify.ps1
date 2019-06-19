#! /usr/bin/pwsh 

[CmdletBinding()]
param (
    [string] $artist,
    [string] $token = $env:SPOTIFY_BEARER_TOKEN     # take in the Spotify Bearer Token as a param
)

# Invoke the search
try {
    $response = Invoke-RestMethod `
        -Method Get `
        -Uri "https://api.spotify.com/v1/search?query=$artist&type=artist&market=NZ&offset=0&limit=1" `
        -Headers @{ Authorization = "Bearer $token" }

    # get the Spotify URI for the first artist search result
    if ($null -eq $response.artists.items[0]) {
        Write-Host "Could not find any Artist named ""$artist"" :/"
    }
    else {
        $spotifyArtistUri = $response.artists.items[0].uri

        # Invoke the Player
        $response = Invoke-RestMethod `
                        -Method Put `
                        -Uri "https://api.spotify.com/v1/me/player/play" `
                        -Headers @{ Authorization = "Bearer $token" } `
                        -Body (ConvertTo-Json @{ "context_uri" = $spotifyArtistUri })
    }
}
catch {
    Write-Verbose $_
    $message = $_.ToString()
    
    if ($message.Substring(0,1) -eq '{'){
        $json = ConvertFrom-Json $message
        Write-Host "Can't play ""$artist"" :\ $($json.error.message)" -ForegroundColor Yellow    
    }
    else {
        Throw
        #Write-Error $_
    }    
}
