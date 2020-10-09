# Runbook: Service Bus persistent failure

**Failure mode**: Service Bus has is not responding to repeated retries after 1 minute.

    1. Wake up Bob
    2. Try redeploy Service Bus, new namespace, same region:
    
       PS> ./deploy-sb –Name 'mysaasapp2-aue-bus' –Region 'Australia East'
    
    If success, change connection string in Azure Configuration Service
    
       PS> ./failover-sb –NewPrimary 'mysaasapp2-aue-bus' –Region 'Australia East'   
    
    If not success, Try redeploy Service Bus, new namespace, secondary Region
    
       PS> ./deploy-sb –Name 'mysaasapp2-ase-bus' –Region 'Australia Southeast'
    
    Change connection string in Azure Configuration Service
    
       PS> ./failover-sb –NewPrimary 'mysaasapp2-ase-bus' –Region 'Australia Southeast'
    
    3. Monitor until primary recovers and then run failback Runbook
    
    (etc...)
