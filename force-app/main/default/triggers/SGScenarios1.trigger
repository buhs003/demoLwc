trigger SGScenarios1 on Account (before insert) {
    switch on trigger.operationType{
        when before_insert{
            for(account ac :trigger.new){
                ac.ShippingCity = ac.BillingCity;
            }
        }
    }
}