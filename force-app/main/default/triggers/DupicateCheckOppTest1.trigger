trigger DupicateCheckOppTest1 on Opportunity (before insert) {
    switch on trigger.operationType{
        when before_insert{
            DuplicateCheckOppTest1Handler.beforeInsertHandler(trigger.new);
        }
    }
}