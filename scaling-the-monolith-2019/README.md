# Scaling the monolith

Monolithic applications can be notoriously difficult to scale in the Cloud. Architecture that worked 
well for tens of thousands of users can fail spectacularly under the load of millions of users. 
However, there can be great value to the business in applications that have been developed and in 
production for years. Do we throw away the old app and start again? Or refactor the application to 
scale to meet the demands of the digital economy?

This talk by Daniel Larsen, Senior Technical Evangelist at Microsoft, addresses the challenge of app 
modernisation and refactoring in depth with practical demos of several Cloud design patterns from 
the [Azure Application Architecture Guide](https://docs.microsoft.com/en-us/azure/architecture/guide/), 
including _Strangler_, _Anti-corruption Layer_, _Cache Aside_, _Materialised View_ and "polygot 
storage". With the right combination of patterns and practices it is possible to extract new value 
out of old code, to scale to the next order of magnitude and to save the business money as we drive 
towards service oriented architecture and micro-services.

## Part one of a Trilogy

### 1. Scaling the monolith

### 2. Refactoring the monolith

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

### 3. Strangling the monolith

    From .NET Framework to .NET Core
    Bounded context and the anti-corruption layer
    Decomposition

## Runsheet

    Hello Webforms
        Webforms + SQL

    The first rule of refactoring
        Tests for that section of code
        Tests for measuring performance
        Performance engineering
        Selenium
        Fiddler
        Postman
    
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

    Azure architecture guide
        Scalability checklist
        Performance antipatterns

    Eventual consistency
        The consistency cost continuum
        Trading consistency for scalability
        Prefer expiration over invalidation

    Query cache
        Demo 1 - Output Cache
        [OutputCache] (Web Forms and MVC Controllers. Also API Controllers)
        TTL in the User story, Domain Model aggregates

    Demo: Azure Front Door


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

## Timings

15' to Load Test demo!


    

    

## Load testing

_"Whenever I do refactoring, the first step is always the same. I need
to ensure I have a solid set of tests for that section of code."_ - Martin Fowler, [Refactoring 2018]

### Demo 1

    <%@ OutputCache VaryByParam="id" Duration="5" %>

## Links

eShopModernizing - Modernizing ASP.NET Web apps (MVC and WebForms) and N-Tier apps (WCF + WinForms)
with Windows Containers and Azure <https://github.com/dotnet-architecture/eShopModernizing>

[Refactoring 2018]:https://learning.oreilly.com/library/view/refactoring-improving-the/9780134757681/ch01.xhtml#ch01lev1sec3

<https://github.com/dotnet/corefx/pull/11968/files>

<https://dotnet.microsoft.com/learn/web/modernizing-server-apps>

Azure DevOps Load Tests: <https://docs.microsoft.com/en-us/azure/devops/test/load-test/get-started-simple-cloud-load-test?view=vsts#view-the-results-of-the-load-test>

Output cache: <https://support.microsoft.com/en-us/help/308375/how-to-control-page-output-caching-in-asp-net-by-using-visual-c-net>

### Load Tests

<https://blogs.msdn.microsoft.com/devops/2016/05/20/feature-preview-creating-load-tests-using-http-archive/>

### Azure Front Door

<https://azure.com/frontdoor>

How Front Door matches requests to a routing rule: <https://docs.microsoft.com/en-us/azure/frontdoor/front-door-route-matching>

### Elastic Database Tools

Scaling out with Azure SQL Database: <https://docs.microsoft.com/en-us/azure/sql-database/sql-database-elastic-scale-introduction>

Get started with Elastic Database Tools: <https://docs.microsoft.com/en-us/azure/sql-database/sql-database-elastic-scale-get-started>

Elastic Database client library with Entity Framework: <https://docs.microsoft.com/en-us/azure/sql-database/sql-database-elastic-scale-use-entity-framework-applications-visual-studio>