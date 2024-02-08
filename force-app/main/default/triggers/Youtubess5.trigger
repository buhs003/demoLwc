trigger Youtubess5 on Account (after update) {
    switch on trigger.operationType{
        when after_update{
            Set<Id> accids = new Set<Id>();
            for(Account acc : trigger.new){
                if(acc.BillingStreet != trigger.oldMap.get(acc.Id).BillingStreet){
                    accids.add(acc.Id);
                }
            }
            List<Account> conaffected = ([SELECT Id,Name,BillingStreet,
                                          BillingState,(SELECT Id,Name FROM Contacts)
                                          FROM Account 
                                          WHERE Id IN :accids]);
            List<Contact> upd = New List<Contact>();
            for(Account acc003 :conaffected){
                List<Contact> co = acc003.Contacts;
                for(Contact con :co){
                    con.MailingStreet = acc003.BillingStreet;
                    con.MailingState = acc003.BillingState;
                    con.AccountId = acc003.Id;
                    upd.add(con);
                }
                
            }
            if(upd.size()> 0)
                update upd;
            
        }
    }
}