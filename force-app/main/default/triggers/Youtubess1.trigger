trigger Youtubess1 on Account (before insert) {
    switch on Trigger.operationtype{
        when before_insert{
            for(Account acc : trigger.new){
                if(string.isnotBlank(acc.BillingStreet) && string.isBlank(acc.ShippingStreet))
                    acc.ShippingStreet = acc.BillingStreet;
            }
            
        }
    }
}