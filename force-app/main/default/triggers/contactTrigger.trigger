trigger contactTrigger on Contact (before insert) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
            contacttriggerhandlar.duprec(trigger.new,trigger.oldMap);
        }
    }
    
}