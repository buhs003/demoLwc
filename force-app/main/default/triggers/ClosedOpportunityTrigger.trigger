trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    switch on trigger.operationtype{
        when after_insert{
            List<Task> toadd = new List<Task>();
            list<Opportunity> relatedtaskswithopp = ([SELECT Id,StageName,(SELECT WhatId,Subject FROM Tasks) 
                                                      from opportunity where Id IN :Trigger.new 
                                                      AND StageName LIKE '%Closed Won%']);
            for(Opportunity opp :trigger.new){
                toadd.add(New Task(WhatId=opp.Id,Subject= 'Follow up Test Task'));
            }
            if(toadd.size()> 0){
                insert toadd;
            }
        }
    }
}