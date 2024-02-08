trigger SGSeniro5 on Account (before insert) {
    switch on trigger.operationtype{
        when before_insert{
            map<Id,Account> mapVariable = new map<Id,account>();
            list<contact> conlist = new list<contact>();
            set<Id> accIds = new set<Id>();
            for(account acc :trigger.new){
                contact c = new contact(); 
                c.LastName = acc.Name;
                accIds.add(c.AccountId);
                conlist.add(c);
            }
            if(conlist.size()>0){
                insert conlist;
            }
            list<Account> acclist = [select id,Client_Contact__c from account where id=:accIds];
            if(acclist.size()>0){
                for(account ac :acclist){
                    mapVariable.put(ac.Id,ac);
                }
            }
            if(conlist.size()>0){
                for(contact cobj :conlist){
                    if(mapVariable.containsKey(cobj.AccountId)){
                    }
                }
            }
        }
    }
}