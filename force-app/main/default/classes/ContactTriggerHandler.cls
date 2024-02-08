public class ContactTriggerHandler {
    public static void afterInsertHandler(list<contact> newRecords){
        set<Id> newIds = new set<Id>();
        for(contact allCon :newRecords){
            if(string.isNotBlank(allCon.AccountId)){
                newIds.add(allCon.AccountId);
            }
        }
        
        AccountContactupdate.AccountContactservice(newIds);        
    }
    public static void afterUpdateHandler(List<contact> newRecords,Map<Id, contact> oldRecordsMap){
        set<Id> newIds = new set<Id>();
        for(contact allCon :newRecords){
            //capture the account id only if active__c is flipped after and condition
            if(string.isNotBlank(allCon.AccountId) && oldRecordsMap.get(allCon.Id).Active__c != allCon.Active__c){
                newIds.add(allCon.AccountId);
                //old account is change to new account value then add both the accounts to the set
            }else if(oldRecordsMap.get(allCon.Id).AccountId != allCon.AccountId){
                newIds.add(allCon.AccountId);
                newIds.add(oldRecordsMap.get(allCon.Id).AccountId);
            }
        }
        
        AccountContactupdate.AccountContactservice(newIds);        
    }
    
}