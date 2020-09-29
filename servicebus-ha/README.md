# Service Bus High Availability

This talk combines two of by favourite things: Service Bus and High Availability architectures. We will also cover the other great technologies that Service Bus enables: Event Hubs and Event Grid. And also talk about availability and recovery concepts, single region design, zone-redundant design and multi-region design.

We will define recovery once and for all. What is a "disaster" in 2020? And how can we protect ourselves from it?

This will be a fast-paced, fast-talking, fast-moving talk. So please drop your question in the chat and don't worry - all assets including slides, video and examples will be available after this talk (in this repo).

> 🎞 **Slides**: [Service_Bus_HA_2020.pdf](./servicebus-ha/Service_Bus_HA_2020.pdf) 

## Outline

    00:00   Welcome, Introduction, Pop quiz
    00:05   About Service Bus, Event Hubs, Event Grid
                How to choose
                Pipes & filters
                Pub/sub
                Event streaming
                Event driven
    00:15   Definitions: 
                Availability
                Recovery
                SLAs, Uptime and Downtime
                Failures, Transient & Persistent
                Service failure
                Zone failure
                Region failure
    00:25   Service Bus is Highly available
                Geo-DR
                Abandon ship!
                Event Grid Geo-DR
                Improving availability
                Improving recovery
    00:35   High availability patterns
                Zone-redundant architecture
                Multi-region architecture
                Active and passive clients
                Intelligent client pattern
    00:45   Advanced patterns and further reading
                Message pump
                Filters and Actions
                Well Architected
                Azure Learn
    00:55   Wrap and questions

## Story

    I use Service Bus, Event Hubs, Event Grid. These are PaaS services. 
    Good news! They are already Highly Available in a single Region configuration.
        Region architecture
        What is in a region
    OK, but what if the service becomes unavailable?
        Handling transient failures: Retry
        Persistent service failures: Wait or runbook.
    OK, but what about persistent failure? (Cooling failure, Fibre cut)
    Good news! Australia East region now supports AZ's. Tick this box, and now the service is resilient to persistent infrastructure failure.
        What is an AZ? How does this protect us?
        What happens during a Zone failure?
    OK, but what if there is an entire Region outage?
        Option 1. Wait.
        Option 2. Run book.
        If RTO is measure in minutes or less, we need multi-region architecture.
        Event Grid: Geo-dr
        For Event Hubs and Service Bus, we need to get out the whiteboard, and also write some code.
            Multi-region architecture
            Active/passive client patterns and the intelligent client
            Abandon ship! Avoid using a message broker as persistent storage
            Message pumps, Filters and Actions
    Before we go
        Well Architected
        Azure Learn

## Slides

<https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services>
<https://github.com/DanielLarsenNZ/talks/blob/master/azure-functions-integration-patterns/Azure%20Functions%20-%20Integration%20Patterns%20-%202020.pdf>