trigger PreventDelAccount on Account (before delete) {
    switch on trigger.operationType{
        when before_delete{
           PreventDelAccountHandler.PreventDelAccount(trigger.old);
        }
    }
}