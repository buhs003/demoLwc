trigger openOppnotmorethan2 on Opportunity (before insert) {
    switch on trigger.operationType{
        when before_insert{
            openOppnotmorethan2Handler.beforeInsertHand(trigger.new);
        }
    }
}