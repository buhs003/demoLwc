public class CTUpdatePersonStatusBatch implements database.Batchable<SObject>{
    public database.QueryLocator start(database.batchableContext bc){
        list<string> healthstatuses = new list<string>{'red','orange','yellow'};
        date today = date.today();
        date fourteenDaysAgo = today - 14;
        return database.getQueryLocator('Select Id,Health_Status__c from person__c where status_update_date__c = :fourteenDaysAgo and Health_Status__c IN :healthStatuses');
        
    }
    public void execute(database.BatchableContext bc,list<person__c> scope){
        for(Person__c person :scope){
            person.Health_Status__c = 'Green';
        }
        update scope;
    }
    public void finish(database.BatchableContext bc){
        
    }
    
}