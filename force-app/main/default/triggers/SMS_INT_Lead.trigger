trigger SMS_INT_Lead on Lead (after insert) {
    switch on trigger.operationType{
        when after_insert{
            set<Id> ledId = new set<Id>();
            for(lead l :trigger.new){
                if(l.Id != null){
                    ledId.add(l.Id);
                    SMS_INT_LeadtoSMS.sendMessage(ledId);
                }
            }
            system.debug(ledId);
       }
    }
}