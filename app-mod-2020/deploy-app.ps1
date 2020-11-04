. ./_vars.ps1

$sql = "appmod-$loc-sql"
$sqlDb = 'CatalogDb'
$sqlAdmin = 'CatalogDbAdmin'
$sqlAdminPassword = "$([System.Guid]::NewGuid().ToString('N'))!"
$insights = 'appmod-insights'
$plan = "appmod-$loc-plan"


# RESOURCE GROUP
az group create -n $rg --location $location --tags $tags


# SQL DB
az sql server create -n $sql -g $rg --location $location --admin-user $sqlAdmin --admin-password $sqlAdminPassword
az sql server firewall-rule create -g $rg -s $sql -n 'ALL_AZURE' --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0
az sql server update --admin-password $sqlAdminPassword -n $sql -g $rg
az sql db create -g $rg --server $sql -n $sqlDb --tags $tags --edition 'Basic' --service-objective 'Basic'
$sqlConn = az sql db show-connection-string -s $sql -n $sqlDb -c ado.net
$sqlConn = $sqlConn -replace '<username>', $sqlAdmin
$sqlConn = $sqlConn -replace '<password>', $sqlAdminPassword
$sqlConn = $sqlConn -replace '"', ''
$sqlConn


# APPLICATION INSIGHTS
$instrumentationKey = ( az monitor app-insights component create --app $insights --location $location `
                        -g $rg --tags $tags | ConvertFrom-Json ).instrumentationKey


# APP SERVICE PLAN
az appservice plan create -n $plan -g $rg --location $location --sku 'P1V3' --number-of-workers 2 --tags $tags


# WEB APP
az webapp create -n $app --plan $plan -g $rg --tags $tags 
az webapp update -n $app -g $rg --client-affinity-enabled false
az webapp config appsettings set -n $app -g $rg --settings `
    "APPINSIGHTS_INSTRUMENTATIONKEY=$instrumentationKey" `
    "Project=eShopLegacyWebFormsSolution\src\eShopLegacyWebForms" `
    "UseMockData=false"
az webapp config connection-string set -g $rg -n $app --connection-string-type 'SQLAzure' `
    --settings CatalogDBContext=$sqlConn    
az webapp deployment source config -n $app -g $rg --branch 'master' `
    --repo-url 'https://github.com/DanielLarsenNZ/eShopModernizing'


start "https://$app.azurewebsites.net"


# Tear down
# az group delete -n $rg --yes
