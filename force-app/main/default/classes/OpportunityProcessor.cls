public class OpportunityProcessor implements database.Batchable<SObject>,database.stateful {
    public integer recordCount =0;
    //start Method
    public Database.QueryLocator start(Database.BatchableContext bc){
        return database.getQueryLocator([Select Id,Name FROM Opportunity]); 
    }
    //execute Method
    public void execute(Database.BatchableContext bc,list<opportunity> opps){
        for(opportunity op :opps){
            op.LeadSource = 'web';
        }
        update opps;
        recordCount = recordCount + opps.siZe();
    }
    //Finish Method
    public void finish(Database.BatchableContext bc){
        system.debug('total opportunity processed'+recordCount);
    }
}