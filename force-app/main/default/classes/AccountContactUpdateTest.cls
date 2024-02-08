public class AccountContactUpdateTest {
    public static void AccountContactUpdteTestService(set<Id> myAccidset){
        List<AggregateResult> results = [SELECT AccountId,count(Id) allActiveCons From Contact
                                         where Active__c = true and AccountId IN 
                                         :myAccidset Group By AccountId];
        map<id,Account> updateAccount = new map<id,Account>();
        for(AggregateResult result :results){
            string accId = string.valueOf(result.get('AccountId'));
            integer ActCon = integer.valueOf(result.get('allActiveCons'));
            
            Account acc = new Account();
            acc.Id = accId;
            acc.ActiveContacts__c = ActCon; 
            updateAccount.put(accId,acc);
        }
        for(Id allIds :myAccidset){
            if(!updateAccount.containsKey(allIds)){
                updateAccount.put(allIds, new Account(Id =allIds,ActiveContacts__c = 0));
            }
        }
        if(!updateAccount.isEmpty())
            update updateAccount.Values();
    }
}