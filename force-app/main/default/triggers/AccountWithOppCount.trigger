trigger AccountWithOppCount on Account (after insert) {
    switch on trigger.operationType{
        when after_insert{
            for(Account acc :trigger.New){
                
            }
        }
    }
}