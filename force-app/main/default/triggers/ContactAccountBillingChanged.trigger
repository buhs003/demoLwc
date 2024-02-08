//trigger on contact mailing city to update account billing city with same name
trigger ContactAccountBillingChanged on Contact (after update) {
    switch on trigger.operationType{
        when after_update{
            set<Id> conId = New set<Id>();
            for(contact c :trigger.new){
                if(c.MailingCity != trigger.oldMap.get(c.id).MailingCity){
                    conId.add(c.id);
                }
            }
            
            List<Account> updateAccount = new List<Account>();
            for(Contact con : [SELECT Id,MailingCity, Account.Id,Account.BillingCity FROM Contact WHERE Id IN :conId])
            {
                con.account.billingcity = con.MailingCity;
                updateAccount.add(con.account);
            } 
            if(!updateAccount.isEmpty()){
                update updateAccount;
            }
            }
        }
    
}