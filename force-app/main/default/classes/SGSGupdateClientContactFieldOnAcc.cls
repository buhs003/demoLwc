public class SGSGupdateClientContactFieldOnAcc {
    public static void afterInsertHandler(list<account> newRecords){
        list<account> accc = new list<account>();
        //map to store quired acc Id and account all fields
        map<id,account> mapofAccount = new map<id,account>();
        //updated contact list's accountId
        set<id> conAccIds = new set<id>();
        //updated contact list
        list<contact> conlist = new list<contact>();
        for(account acc :newRecords){
            contact conobj = new contact();
            conObj.AccountId = acc.Id;
            conObj.lastName = acc.Name;
            //add updated contact in list of contact
            conlist.add(conobj);
            //add updated contacts accountId in set above
            conAccIds.add(conObj.AccountId);
        }
        if(conlist.size() > 0){
            insert conlist;
        }
        list<account> accquery = [select id ,Client_Contact__c
                                  from account where Id In :conAccIds];
        if(accquery.size()>0){
            for(account ac :accquery){
                mapofAccount.put(ac.Id,ac);
            }
        }
        if(conlist.size()>0){
            for(contact cc :conlist){
                if(mapofAccount.containsKey(cc.AccountId)){
                    account a = mapofAccount.get(cc.AccountId);
                    
                    a.Client_Contact__c  = cc.Id;
                    accc.add(a);
                }
            }
        }
        if(accc.size()>0){
            update accc;
        }
    }
}