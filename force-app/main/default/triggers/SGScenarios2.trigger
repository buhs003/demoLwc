trigger SGScenarios2 on Account (after update) {
    switch on trigger.operationType{
        when after_update{
            SGScenarios2Handler.afterupdate(trigger.new);
        }
    }
}