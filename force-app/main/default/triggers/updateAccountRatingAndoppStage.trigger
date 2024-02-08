trigger updateAccountRatingAndoppStage on Account (after insert) {
    switch on trigger.operationtype{
        when after_insert{
            for(Account ac :trigger.new){
                system.debug(ac);
            }
        }
    }
}