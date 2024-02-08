trigger AccountcontactBillingChanged on Account (after update) {
    switch on trigger.operationType{
        when after_update{
            AccountcontactBillingChanged.afterupdateHand(trigger.new,trigger.oldMap);
        } 
    }
}