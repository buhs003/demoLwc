trigger Youtubess2 on Account (before update) {
    switch on trigger.operationtype{
        when before_update{
            for(Account acc : trigger.new){
                if(acc.AnnualRevenue <1000){
                    acc.AnnualRevenue.addError('Invaild AnnualRevenue');
                }
                
            }
        }
    }
}