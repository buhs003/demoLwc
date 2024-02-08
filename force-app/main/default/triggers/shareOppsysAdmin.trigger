trigger shareOppsysAdmin on Opportunity (before insert) {
    switch on trigger.operationtype{
        when before_insert{
            set<id> allIds = new set<id>();
            for(opportunity myopp :trigger.new){
                if(myopp.Amount > 0){
                    allIds.add(myopp.Id);
                }
            }
            list<OpportunityShare> allUsers = [SELECT Id, OpportunityId, UserOrGroupId FROM OpportunityShare where Id In :allIds];
        }
    }
}