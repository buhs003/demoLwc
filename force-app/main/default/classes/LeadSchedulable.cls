public class LeadSchedulable implements Schedulable{
    public void execute(SchedulableContext sc){
        //write your code here 
        list<lead> existingRecords = [select id,leadSource from lead];
        for(lead record :existingRecords){
            record.leadSource = 'web';
        }
        update existingRecords;
    }
    
}