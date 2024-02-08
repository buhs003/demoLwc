public class futureMethodcalculateTotalNoofcontacts {
    @future
    public static void calcualtetotalnoofcontacts(list<id> accIds){
        list<account> accList = [select id,(select id from contacts) 
                                 from account where  id In:accIds];
        for(account ac :accList){
            ac.CountOfContact__c = ac.contacts.size();
            
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}