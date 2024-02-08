public class CTPeopleTracingDataCleanupBatch implements database.Batchable<SObject> {
    
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select id from people_tracing__c where contact_date__c <last_n_days :30');
    }
    public void execute(database.BatchableContext bc,list<people_tracing__c> scope){
        delete scope;
    }
    public void finish(database.BatchableContext bc){
        
    }
}