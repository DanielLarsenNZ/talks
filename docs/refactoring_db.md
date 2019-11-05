# Notes on refactoring a Database for scale

## Draw a roadmap

Roadmaps are useful for visualising projects, aligning teams and managing up.

* How do we tackle large problems? Break the mountain down into rocks and pebbles.
* Practice [Improvement Kata](https://www.lean.org/Workshops/WorkshopDescription.cfm?WorkshopId=68); 
  each milestone on the roadmap should bring value to the business.

### Roadmap example

                                                                        Large &
                                                                        outlier
                                                                        tenants
                                                                        migrated
                                                            Medium    ↗
                                                            tenants
                                                            migrated                                
                                                Small     ↗
                                                tenants
                                                migrated                                
                                    New     ↗
                                    tenants
                                    onboarded
                        Pilot     ↗
                        tenants
                        migrated
    ◆ CODE  ◆ DB   ↗
      READY   READY

* See below for Code Ready and DB Ready roadmaps
* Once code and DB changes have been made and tooling is in place, and the new multi-tenancy DB is in
  Production, a pilot group of tenants are migrated to "canary" the system. 
* When the system is stable it is ready for new tenants (customers). From this date all new tenants
  are onboarded to the new system.
* Migration proper begins with batches of tenants migrated from the old system to the new. First small
  / low-risk tenants, then medium sized tenants. Large and outlier tenants (those with customisations
  that don't fit one schema) are migrated on a case-by-case basis. Some tenants may take a long time
  to be migrated, or never be migrated as diminishing returns applies here.

### Db ready example

                                                    ◆ DB
                                                        READY
                                        Split-   ↗
                                        merge
                                        tooling
                            Shard  ↗
                            master
                ◆ One   ↗
                  Schema
                  (Dacpac)
    DB       ↗   
    Version 
    Control

* Microsoft recommends using [SQL Server Database Tools (SSDT) and Visual Studio](https://visualstudio.microsoft.com/vs/features/ssdt/). 
  A new schema (DDL) 
  is created that is duck-typed to the old schema as much as possible. In this case "schema" means the
  definition of a single Database (DDL), _not_ the SQL DB schema objects (dbo, etc), Pragmatic choices are made between
  keeping existing schema features and refactoring. These are _design decisions_ (there is no standard 
  approach).
* At the end of the DB Version Control work their should be one Database definition exported as a Dacpac
  that is the "one schema to rule them all" (this is harder than it sounds!)
* One important feature of the schema is that a Tenant identifier should be a primitive of the Database,
  i.e. Tables that represent root entities should include a Tenant Id as a key field. All queries to
  the database should include the Tenant Id as a parameter.
* A *Shard master* is a database that contains meta-data about which tenant resides in which database.
  _Split-merge tooling_ is a set of tools that DBAs and Ops people use to onboard tenants, and move
  tenants from one shard to another. Microsoft provides these tools and more in a set of libraries and
  tooling called [Elastic Database Tools](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-elastic-scale-introduction).
* There are [several SaaS tenancy models to choose from](https://docs.microsoft.com/en-us/azure/sql-database/saas-tenancy-app-design-patterns)
  that are supported by Elastic DB Tools. The examples in this article follow the [Multi-tenant app
  with sharded multi-tenant databases](https://docs.microsoft.com/en-us/azure/sql-database/saas-tenancy-app-design-patterns#g-multi-tenant-app-with-sharded-multi-tenant-databases)
  pattern.

The Database is ready for multi-tenancy when:

1. There is one schema that is deployed to all environments, including Dev, Test, UAT, Staging, Prod.
   As well as all regions: US, Australia, UK, etc.
1. The Database schema (Dacpac) can be automatically deployed to any environment via a CI/CD pipeline
   within minutes.
1. The DB schema can be upgraded/migrated automatically via a CI/CD pipeline
1. A query to any Table (that represents a root entity) includes a tenant id and only returns data for
   that tenant.

### Code ready example

                                                            ◆ CODE
                                                              READY
                                                    Stored ↗
                                                    procs  
                                        schema  ↗
                                        objects 
                            Dynamic ↗
                            conn /
                            UoW
                Data    ↗
                Access
                Layer
    TenantId  ↗
    primitive

