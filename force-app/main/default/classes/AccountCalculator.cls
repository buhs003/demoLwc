public class AccountCalculator {
    @future
    public static void countContacts(list<id> accIds){
        list<Account> acclist = [select id,(select id from contacts)
                                 from account where id in:accIds];
        for(account acc :acclist){
            acc.CountOfContact__c = acc.contacts.size();
        }
        if(acclist.size() > 0){
            update acclist;
        }
    }
}