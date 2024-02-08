public class LeadQueuable implements Queueable{
    public void execute(Queueablecontext context){
        list<lead> existingRecords = [select id,leadSource from lead];
        for(lead record :existingRecords){
            record.leadSource = 'web';
        }
        update existingRecords;
        //can call another queueable class.
    }
    
}