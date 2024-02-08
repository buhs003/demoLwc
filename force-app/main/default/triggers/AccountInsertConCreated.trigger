trigger AccountInsertConCreated on Account (after insert) {
    switch on trigger.operationType{
        when after_insert{
            list<contact> conToupdate = new list<contact>();
            for(Account acc :trigger.new){
                contact c = new contact();
                c.AccountId = acc.Id;
                c.LastName = acc.Name;
                conToupdate.add(c);
            }
            insert conToupdate;
        }
    }
}