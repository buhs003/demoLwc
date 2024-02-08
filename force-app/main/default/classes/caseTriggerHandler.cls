public class caseTriggerHandler {
    public static void updateAccount(list<case> caseRec){
        list<Account> acctoup = new list<account>();
        for(case c :caseRec){
            if(c.AccountId != null){
                Account a = new Account();
                a.Id = c.AccountId;
                a.latestCaseNumber__c = c.CaseNumber;
                acctoup.add(a);
            }
            
            
        }
        if(!acctoup.isEmpty()){
            update acctoup;
        }
    }    

}