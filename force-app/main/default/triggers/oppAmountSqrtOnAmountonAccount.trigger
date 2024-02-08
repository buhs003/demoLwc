trigger oppAmountSqrtOnAmountonAccount on Opportunity (after insert,after update) {
    switch on trigger.operationtype{
        when after_update{
            list<Account> acctoupdate = new list<Account>();
            for(Opportunity op :trigger.new){
                Account acc = new Account();
                Decimal check = math.sqrt(op.Amount);
                acc.Id = op.AccountId;
                acc.Sqrt_Amount__c = check;
                acctoupdate.add(acc);
            }
            if(acctoupdate.isEmpty() && acctoupdate.size()>0)
            update acctoupdate;
        }
    }
}