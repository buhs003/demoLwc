trigger SGAccountupdatesTotaloppamount on Account (after update) {
    switch on trigger.operationtype{
        when after_update{
            SGAccountupdatesTotaloppamounthandler.afterupdate(trigger.new);
        }
    }
}