trigger SGupdateSerialNoOnOppoLineItem on OpportunityLineItem (before insert) {
    switch on trigger.Operationtype{
        when before_insert{
            SGupdateSerialNoOnOppoLineItemHandler.beforeInsert(trigger.new);
        } 
    }
}