trigger checkoppandupdateAccount on Opportunity (after update) {
    switch on trigger.operationtype{
        when after_update{
            List<Account> toupdate = new list<Account>();
            for(Opportunity op :trigger.new){
                if(op.StageName == 'Closed Won'){
                    Account acc = new Account();
                    acc.id = op.AccountId;
                    acc.Rating = 'Hot';
                    toupdate.add(acc);
                    system.debug(+acc);
                }
            }
            if(toupdate != null && toupdate.size() > 0){ 
            update toupdate;
            }
        }
    }
}