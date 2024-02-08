trigger OppAmountCnjUpdateAcc on Opportunity (after insert,after update) {
    switch on trigger.operationType{
        when after_update{
            List<Account> rec = New List<Account>();
            for(Opportunity oppRecords : trigger.new){
                if(oppRecords.Amount > 0){
                    Account accRecord = new Account();
                    accRecord.Id = oppRecords.AccountId;
                    accRecord.Eligible__c = true;
                    rec.add(accRecord);
                }
            }
            if(rec != null && rec.size()>0){
                update rec;
            }
        }
    }
}