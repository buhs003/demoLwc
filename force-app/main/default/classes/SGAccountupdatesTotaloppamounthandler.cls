public class SGAccountupdatesTotaloppamounthandler {
    public static void afterupdate(list<account> newrecords){
        set<id> accId = new set<id>();
        for(account acc :newrecords){
            accId.add(acc.Id);
        }
        //map to get the Account Id and the sum of its related opportunities amount to insert later
        map<Id,Double> amountMap = new map<id,double>();
        //AggregateResult to get the sum of opportunities amount grouped by Account Id
        list<aggregateResult> result = [SELECT AccountId,sum(amount)totalAmount 
                                        from opportunity 
                                        where AccountId IN 
                                        :accId   group by AccountId];
        if(result.size()>0){
            for(AggregateResult res :result){
                //getting the AccountId and sum(Amount) in separate variables and putting it to map
                id accountId = (id)res.get('AccountId');
                double totalamount = (double)res.get('totalAmount');
                amountMap.put(accountId,totalamount);
            }
        }
        //Again looping the accounts which are getting updated and making changes in "Total Opportunity Amount" field
        List<Account> updateAccount = new List<Account>();
        for(account ac :newrecords){
            Account objacc = new Account();
            objacc.Id = ac.Id;
            objacc.Total_Opportunity_Amount__c = amountMap.get(ac.id);
            updateAccount.add(objacc);
        }
        if(!updateAccount.isEmpty()){
            if(Recursive.flag == true){
                Recursive.flag = false; 
                update updateAccount;    
            }
        }
    }
}