trigger SGAccountshipAddressupdated on Account (before update) {
    switch on trigger.operationtype{
        when before_update{
            for(account acc :trigger.new){
                if(acc.BillingCity != trigger.oldMap.get(acc.id).BillingCity){
                    acc.ShippingCity = acc.BillingCity;
                }
            }
        }
    }
}