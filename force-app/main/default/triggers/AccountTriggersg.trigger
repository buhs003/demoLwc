trigger AccountTriggersg on Account (before insert,after insert) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
            
            AccountTriggerHandlersg.updateRating(trigger.new);
            //When an account inserts and CopyBillingToShipping (Custom Field) checkbox is
            //checked then automatically copy account billing address into account shipping
            //address.
            AccountTriggerHandlersg.updateAddress(trigger.new);
            
        }
        when AFTER_INSERT{

           // AccountTriggerHandlersg.shareAccWithStdUser(trigger.new);
           AccountTriggerHandlersg.changeOwner(trigger.new,trigger.oldMap);
        }
    }
    
}