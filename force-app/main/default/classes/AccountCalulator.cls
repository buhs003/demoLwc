public class AccountCalulator {
    @future
    public static void countContacts(list<id> accIds){
        list<account> acclist = [select id,Name ,(select id from contacts) from account where id=:accIds];
        for(account acc :acclist){
            acc.ActiveContacts__c = acc.contacts.size();
            
        }
        if(!acclist.isEmpty()){
            update acclist;
        }
    }

}