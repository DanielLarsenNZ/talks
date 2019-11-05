# Refactoring the Monolith

> Part two of a trilogy: 1. [Scaling the monolith](/scaling-the-monolith-2019), 2. [Refactoring the
> monolith](./refactoring-the-monolith-2019), 3. [Strangling the monolith](/strangling-the-monolith-2020)

## Treatment

### Refactoring

    The first rule of refactoring
        Tests for that section of code
        Tests for measuring performance
        Performance engineering
        Selenium
        Fiddler

    Bounded context and the anti-corruption layer

    Busy database - business in your DB

    From sync to async

    Abstraction

    IoC

    The baseline
        KPIs for performance
        What is important to the business?
        Cost
        Density
        Performance drives density drives cost drives growth drives investment and the cycle
            continues

    Low hanging fruit
        Where is the bottleneck?
        Where are the low hanging fruit
        A prioritised backlog
        The platform team are best suited for this work IMO

    Tooling
        Load test tooling
        Postman / Newman
        VS Code HTTP extension
        Testing
            Integration Tests
            API Tests
            Selenium Tests



### Strangling

    From .NET Framework to .NET Core
    Bounded context and the anti-corruption layer
    Decomposition

    Eventual consistency
        The consistency cost continuum
        Trading consistency for scalability
        Prefer expiration over invalidation

    Tools of the trade
        Service Bus
        Logic Apps
        Cosmos DB
        Azure SQL DB - Elastic Pools

    Patterns of the trade
        De-coupling
        De-composition
        Anti-corruption layer
        Queue-load-leveling
        Pub/sub

## Refactoring the Database


    Scaling SQL Server
        Elastic DB framework
        Entity Framework or Dapper  
        Demo 2 - Dapper
        Good old stored procs
        Pauper's CQRS
        Reserved Instances

    Queue load levelling
        Event sourcing
        The power of Materialised View

    Polygot persistence
        Use Cosmos DB
        The tools for the job
        SQL is an API on ACID
        RAM is cheap
        Storage is cheaper
        Key value (Redis)
        Table API
        NoSQL API
        Graph API
        Columnar API
        Store blobs in Blob storage
        CDN
        Abstraction is your friend
        Demo 3 - Redirecting storage calls at the Service layer

    The list goes on
        40+ items on the Scalability checklist and Performance antipatterns checklist. They are all
            worth studying

    Web tier
        404's and unused files
        Large requests

    The thin edge of the wedge
        Improper instantiation
        String handling
        Span<T>
        Long methods
        Garbage collection
        Processor caches and invalidation
        Large messages
        Readonly Session State
