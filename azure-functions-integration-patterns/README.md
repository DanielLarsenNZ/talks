# Integration patterns with Azure Functions

Global Integration Bootcamp 2020

## Run sheet

    Slides
    
    Demo 1: Message Genny

    Q. What is the first thing you make when you are spiking an Integration Pipeline?
    A. A message genny

    A Timer function needs a Storage account - why?

    Install-Package Microsoft.Azure.WebJobs.Extensions.ServiceBus
    [ServiceBus("queue101", Connection = "ServiceBusConnectionString")]IAsyncCollector<Message> messages,

    var message = new Message(Encoding.UTF8.GetBytes("New Message!"));
    await messages.AddAsync(message);

    ServiceBusConnectionString

    # Behold, the Functions CLI!

    A queue with no consumer is not particularly useful. Let's add a receiver.