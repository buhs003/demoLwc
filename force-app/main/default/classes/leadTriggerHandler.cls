public class leadTriggerHandler {
    Public static Boolean allreadyExecuted = False;
    public static void beforeInsertHandler(List<Lead> newRecords ){
        for(Lead leadRecord : newRecords){
            if(String.isblank(leadRecord.LeadSource )){
                leadRecord.LeadSource = 'Other';
                
            }
            //Industry Validation 
            if(String.isBlank(leadRecord.Industry) ){
                leadRecord.addError('Industry Cannot Be Blank');
            }
            
        }
    }
    public static void afterInsertHandler(List<Lead> newRecords ){
        List<Task> leadrecTask = new List<Task>();
        for(Lead leadRecord : newRecords){
            //create a lead Task 
            Task leadTask = new Task(Subject='Follow Up On Lead Status', WhoId=leadRecord.Id);
            leadrecTask.add(leadTask); 
        }
        insert leadrecTask;
    
    //insert a  lead record
    if(leadTriggerHandler.allreadyExecuted == false){
        leadTriggerHandler.allreadyExecuted = true;
        Lead leadRecord = New Lead(LastName = 'Test Lead Single',Status ='Open-Not Contacted');
        insert leadRecord;    
    }
}
    

public static void beforeUpdateHandler(List<Lead> newRecords,Map<Id,Lead> oldRecords){
    for(Lead leadRecord : newRecords){
        if(String.isblank(leadRecord.LeadSource )){
            leadRecord.LeadSource = 'Other';
            
        }
        //Cannot Close the leadStatus directly
        if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') && oldRecords.get(leadRecord.Id).Status == 'Open - Not Contacted'){
            leadRecord.Status.addError('LeadStatus Cannot Be Closed Directly');
        }
    }
}
}