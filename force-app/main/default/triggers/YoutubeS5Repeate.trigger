trigger YoutubeS5Repeate on Account (after update) {
    switch on trigger.operationType{
        when after_update{
            Set<Id> accwithIds = New Set<Id>();
            for(Account acc : trigger.new){
                if(acc.BillingStreet != Trigger.OldMap.get(acc.id).BillingStreet)
                    accwithIds.add(acc.Id);
            }
            List<Account> contraced = ([SELECT Id,Name,BillingStreet,(SELECT Id,Name FROM Contacts) From Account WHERE Id IN :accwithIds]);
            
            List<Contact> toupdate = New List<Contact>();
            For(Account acc001 :contraced){
                List<Contact> cons = acc001.Contacts;
                for(Contact cons123 :cons){
                    cons123.MailingStreet = acc001.BillingStreet;
                    cons123.AccountId = acc001.Id;
                    toupdate.add(cons123);
                }
            }
            if(toupdate.Size() > 0)
                update toupdate;
        }
        
    }
}