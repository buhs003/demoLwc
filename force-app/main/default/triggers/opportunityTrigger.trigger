trigger opportunityTrigger on Opportunity (before insert) {
    switch on trigger.operationType{
        when before_Insert{
            opportunityTriggerHandler.updateOpportunitydescription(trigger.new);
        }
    }

}