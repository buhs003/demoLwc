trigger caseTrigger on Case (before update,after insert) {
    switch on trigger.Operationtype{
        when BEFORE_UPDATE{
            for(Case c :trigger.new){
                if(c.Origin == 'Email'){
                    c.Status = 'New';
                    c.Priority = 'Medium';
                }
                
            }
        }
        when AFTER_INSERT{
            caseTriggerHandler.updateAccount(trigger.new);
        }
    }

}