trigger SGSeniro4 on Account (before update) {
    switch on trigger.OperationType{
        when before_update{
            set<id> accids = new set<id>();
            for(account ac :trigger.new){
                accids.add(ac.Id);
            }
            Map<Id,Double> amountMap = new Map<Id,Double>();
            list<Aggregateresult> result = [select AccountId,sum(amount) totalamount
                                            from opportunity  where accountId in :accids group 
                                            by accountId];
            for(aggregateResult a :result){
                id accountId = (id)a.get('AccountId');
                Double totalAm = (Double)a.get('totalamount');
                amountMap.put(accountId,totalAm);  
            }
            for(account ac :trigger.new){
                if(amountMap.containskey(ac.Id)){
                    ac.Total_Opportunity_Amount__c = amountMap.get(ac.Id);
                    system.debug(amountMap);
                }
            }
        }
    }
}