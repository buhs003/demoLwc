trigger CreateOpportunityAccountCreated on Account (after insert) {
    switch on trigger.operationType{
        when after_insert{
            CreateOpportunityAccountCreatedHandlar.createOpprtunityAccountCreatedHandler(trigger.New);
        }
    }
}