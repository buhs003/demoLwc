trigger oppCountonAccount on Opportunity (after insert) {
    switch on trigger.operationType{
        when after_insert{
            List<Account> toupdate = new List<Account>();
            set<Id> allIds = new Set<Id>();
            for(Opportunity opp : trigger.New){
                allIds.add(opp.AccountId);
            }
            List<Account> accList = [SELECT Id,CountOfOpportunity__c, (select id from Opportunities) 
                                           FROM Account where id In :allIds];
            for(Account acc :accList){
                acc.CountOfOpportunity__c = acc.Opportunities.size();
                
                toupdate.add(acc);
            }
            if(!toupdate.isEmpty()){
                update toupdate;
            }
            
        }
            
    }
}