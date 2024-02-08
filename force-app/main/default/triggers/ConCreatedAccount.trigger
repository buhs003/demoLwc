trigger ConCreatedAccount on Contact (after insert) {
    switch on trigger.Operationtype{
        when after_insert{
            if(Recursive.flag){
                Recursive.flag = false;
                list<account> ccList = new list<account>();
                for(contact c :trigger.new){
                    account acc = new account();
                    acc.Id = c.AccountId;
                    acc.Name = c.LastName;
                    acc.Phone = c.Phone;
                    ccList.add(acc);
                }
                insert ccList;
           }
        }
    }
}