trigger SGAccountUpdatedCheckOpp on Account (after update) {
    switch on trigger.operationtype{
        when after_update{
            Set<Id> accountIds = new Set<Id>();
            for(Account a:Trigger.new){
                accountIds.add(a.Id);
            }
            
            List<Opportunity> oppListToUpdate=new List<Opportunity>();
            List<Opportunity> oppList = [Select Id, AccountId, StageName, CreatedDate,
                                         CloseDate from Opportunity where createdDate = last_N_Days :30 AND AccountId in :accountIds];
            if(oppList.size()>0){
                for(Opportunity opp : oppList){
                    if(opp.StageName!='Closed Won'){
                        opp.StageName='Closed Lost';
                        opp.CloseDate=date.today();
                        oppListToUpdate.add(opp);
                    }
                }
            }
            if(oppListToUpdate.size()>0){
                update oppListToUpdate;
            }
        }
    }
    
}