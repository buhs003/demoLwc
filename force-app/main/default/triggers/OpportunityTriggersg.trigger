trigger OpportunityTriggersg on Opportunity (before insert) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
            OpportunityTriggersgHandler.updateDec(trigger.new);
        }
    }

}