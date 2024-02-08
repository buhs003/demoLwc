public class OppProcessor implements Database.Batchable<sobject>,database.stateFul{
    
    public integer recordCount = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([select id ,name from opportunity]);
    }
    public void execute(Database.BatchableContext bc,List<opportunity> opps){
        for(opportunity op :opps){
            op.leadSource = 'web';
        }
        update opps;
        recordCount = recordCount + opps.Size();
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Total records prossed	'+recordCount);
    }
    
}