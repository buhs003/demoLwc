trigger ContactInsertedUpdAccount on Contact (after insert) {
    switch on trigger.operationType{
        when after_insert{
            List<Account> toUpdate = new list<Account>();
            set<Id> conIds = New set<Id>();
            for(Contact con :trigger.new){
                conIds.add(con.AccountId);
            }
            list<Account> acctoupdte = [select Id,CountOfContact__c,(SELECT Id FROM Contacts) FROM Account where Id In :conIds];
            for(Account acc :acctoupdte){
                acc.CountOfContact__c = acc.Contacts.size();
                toUpdate.add(acc);
            }
            if(!toUpdate.isEmpty())
                update toUpdate;
        }
    }
}