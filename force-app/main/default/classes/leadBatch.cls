//interface for batch class 
public class leadBatch implements database.Batchable<sobject>{
    //method1 
    //it executes only once
    //return batch scope or records and divides them in small batches 
    public database.QueryLocator start(database.BatchableContext bc){
        string query = 'select id,leadSource from lead';
        //batch scope in this method
        //at the end a getquerylocator method is initilized with scope.
        //query records are supplied to getquerylocator method can return 50m records.
        return database.getquerylocator(query);
    }
    //method2
    //executes for each batch/chunks of records.
    //eg if batch scope/querylocator output = 50000 records
    //and batch size = 2000
    //total execution of 'execute' method = 50000/2000 = 25times execute method runs.
    //must have void return type.
    //each execution gets saperate set of governer limit.
    public void execute(database.BatchableContext bc,list<lead> scope){
        for(lead leadRecord :scope){
            //process each chunk of records in this method
            leadRecord.leadSource = 'web';
        }
        update scope;
        system.debug(scope);
       system.debug(scope.size());
    }
    //method3
    //executes only once when all batches are processed.
    //used for some post processing for eg calling an another batch class or sending an email about a batch completion.
    public void finish(database.BatchableContext bc){
        //do final processing in this method
        //like sending email or calling another batch class
        system.debug('batch finished');
        //call another batch class
    }
}