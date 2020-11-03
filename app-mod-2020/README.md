# Application modernization in Azure

_Pro-tips for software engineers and architects_

The Cloud presents the perfect environment for hosting line-of-business and custom applications. Many organizations are migrating apps to Azure to reduce costs and management overhead as well as improve performance, availability and security. So, where do we start with app migration and modernization? Azure Engineer Daniel Larsen will walk through key considerations, typical migration plans, and how to refactor applications to take advantage of the benefits of cloud hosting.

> 🎞 [Download slides](./App-mod-2020.pdf)

## Outline

```
I
Intro
Where do we start?
    CAF, WAF
	Migration tools
	Migration programs

II
Typical migration plans
	Prioritise the estate
	Quick and easy wins / 80/20 rule
	Hosting choices
        Most apps will land on App Services
            incl. Web Jobs and Functions 
        Other options include AKS and VMSS
	FTA-Migration

III
Key considerations & drivers
	Management overhead
		AZ CLI, GitHub deploy
		[Test on prod]
        DEMO: AZ CLI
	Reduce costs
		Consolidate Apps & DBs (Pricing calculator)
		Staging slots
        DEMO: Staging slot deploy
	Improve performance
		Example: AFD Cache
		*Don't split Web/App and DB tier
        DEMO: Loader.io + AFD
	Improve availability
		Example: Zone Redundancy
	Improve security
		Example: Easy Auth
        DEMO: Easy Auth

IV
Refactor for Cloud
	Output cache
	Azure Front Door
	GO statements, Using statements, Cross DB joins
	Session State Provider

V
Wrap and questions
```