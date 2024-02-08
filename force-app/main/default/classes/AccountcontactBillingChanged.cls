public class AccountcontactBillingChanged {
    public static void afterupdateHand(List<Account> newRecords,Map<Id, Account> oldrecordsMap){
        set<Id> accountIdsAffected = new set<Id>(); 
        for(Account acc :newRecords){
            if(acc.BillingCity != oldrecordsMap.get(acc.Id).BillingCity){
                accountIdsAffected.add(acc.Id);
            }
        }
        list<contact> con = new list<contact>();
        for(Account acc : [SELECT BillingCity,(SELECT MailingCity FROM Contacts) FROM Account])
        {
            for(Contact c : acc.contacts){
                c.MailingCity = acc.BillingCity;
                con.add(c);
            }
        }
        if(con != null && con.size()> 0){
            update con;
        }
    }
}