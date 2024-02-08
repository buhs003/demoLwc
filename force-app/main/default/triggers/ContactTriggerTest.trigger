trigger ContactTriggerTest on Contact (after insert,after update,after delete,after undelete) {
    switch on trigger.operationType {
        when after_insert{
            ContactTriggerTestHandler.afterinsertHandlertest(trigger.new);
        }
        when after_update{
            ContactTriggerTestHandler.afterUpdateHandlertest(trigger.new,trigger.oldMap);
        }
        when after_delete{
            ContactTriggerTestHandler.afterdeleteHandlertest(trigger.old);
        }
        when after_undelete{
            ContactTriggerTestHandler.afterundeleteHandlertest(trigger.new);
        }
    }
}