public class AccountContactupdate {
    public static void AccountContactservice(set<id> myAccidset){
        //get the aggregate result for all accounts
        List<AggregateResult> results = [SELECT AccountId,Count(Id) conCount from contact 
                                         where Active__c = TRUE And AccountId In
                                         :myAccidset GROUP BY AccountId];
        //build final lsit of accounts to update
        Map<Id,Account> accountsToupdate = new map<Id,Account>();
        for(AggregateResult result :results){
            //get account id and number of active contacts
            string accId = string.valueOf(result.get('AccountId'));
            integer totalContacts = integer.valueOf(result.get('conCount'));
            
            Account acc = new Account(Id = accId,ActiveContacts__c = totalContacts);
            accountsToupdate.put(accId,acc);
        }
        //update accounts with zero active contacts
        for(Id accIds :myAccidset){
            if(!accountsToupdate.containsKey(accIds)){
                accountsToupdate.put(accIds,new Account(Id = accIds, ActiveContacts__c = 0));
            }
        }
        if(accountsToupdate != Null && accountsToupdate.size() > 0)
            update accountsToupdate.values();
        
    }
}