trigger AccountTaskCreator on Account (after insert) {
    switch on trigger.operationType{
        when after_insert{
            AccountTaskCreatorHandler.afterInsertHandler(Trigger.new);
        }
    }
}