public class leadfutureAsynchronous {
    //method accept only primitive data-types or collection of primitive datatypes.
    //method is static with void return.
    //execute when system resources are available.
    //cannot call future method or any async transaction from anthor async transaction.
    //but can call multipal future or async methods/transaction from syncronous transaction.
    @future
    public static void updateleadrecords(set<id> existingRecordsIds){
        //primitive data type usage gives latest value of records to update
        list<lead> existingRecords = [select id,leadSource from lead where id in :existingRecordsIds];
        for(lead record :existingRecords){
            record.leadSource = 'web';
        }
        update existingRecords;
        system.debug(existingRecords);
    }
    @future
    public static void createleadrecord(){
        lead anotherLead = new lead(lastName = 'Test Lead Single', status='Open-Not Contacted',company='SFDC Facts001');
        insert anotherLead;
        anotherLead.LeadSource = 'Phone Inquiry';
        update anotherLead;
        system.debug('New Lead Record'+anotherLead);
    }
}