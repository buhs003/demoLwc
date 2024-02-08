public class sendEmailBatchhelper {
    public String batchMessage { get; set; }
    
    
    public list<string> ids;
    public sendEmailBatchhelper(ApexPages.StandardSetController controller){
        this.ids = new list<string>();
        List<sObject> records = controller.getSelected();
        for (sObject record : records) {
            this.ids.add(record.Id);
        }
    }
    
    
    public void runBatch(){
        String query = 'SELECT Id, Name, Email, RecordTypeId,RecordType.Name FROM Contact WHERE Id IN (' + String.join(this.ids, ',') + ')';
        database.executeBatch(new SendEmailBatch(query), 10);
        this.batchMessage = 'Emails Sent Sucessfully.';
        
    }
}