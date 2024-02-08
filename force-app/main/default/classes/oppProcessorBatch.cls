public class oppProcessorBatch  implements database.Batchable<SObject>,database.stateful{
    public integer recordCount = 0;
    
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator([select id ,name from opportunity]);
    }
    public void execute(database.BatchableContext bc,list<Opportunity> opps){
        for(opportunity op :opps){
            op.leadSource = 'Web';
        }
        update opps;
        recordCount = recordCount + opps.size();
    }
    public void finish(database.BatchableContext bc){
        system.debug('Total records processed'+recordCount);
    }
}