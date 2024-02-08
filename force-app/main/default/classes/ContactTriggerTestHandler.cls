public class ContactTriggerTestHandler {
    
    //method
    public static void afterinsertHandlertest(list<contact> newRecords){
        set<Id> myAccidset = new set<id>();
        
        for(Contact myCon :newRecords){
            if(string.isNotBlank(myCon.AccountId)){
                myAccidset.add(myCon.AccountId);
            }
        }
        AccountContactUpdateTest.AccountContactUpdteTestService(myAccidset);
    }
    
    //method
    public static void afterupdateHandlertest(list<contact> newRecords,Map<Id,contact> oldRecordsMap){
        set<Id> myAccidset = new set<id>();
        
        for(Contact myCon :newRecords){
            if(string.isNotBlank(myCon.AccountId) && oldRecordsMap.get(myCon.Id).Active__c != myCon.Active__c){
                myAccidset.add(myCon.AccountId);
            }else if(oldRecordsMap.get(myCon.Id).AccountId != myCon.AccountId){
                myAccidset.add(myCon.AccountId);
                myAccidset.add(oldRecordsMap.get(myCon.Id).AccountId);
            }
        }
        AccountContactUpdateTest.AccountContactUpdteTestService(myAccidset);
        
    }
    
    //method
    public static void afterdeleteHandlertest(list<contact> oldcontacts){
        set<Id> myAccidset = new set<id>();
        
        for(Contact myCon :oldcontacts){
            if(string.isNotBlank(myCon.AccountId)){
                myAccidset.add(myCon.AccountId);
            }
        }
        AccountContactUpdateTest.AccountContactUpdteTestService(myAccidset);
        
    }
    
    //method
    public static void afterundeleteHandlertest(list<contact> newcontacts){
        set<Id> myAccidset = new set<id>();
        
        for(Contact myCon :newcontacts){
            if(string.isNotBlank(myCon.AccountId)){
                myAccidset.add(myCon.AccountId);
            }
        }
        AccountContactUpdateTest.AccountContactUpdteTestService(myAccidset);
        
    }
}