@isTest
public class caseTriggerHandlerTest {
    @isTest
    public static void updateAccountTest(){
        //create test data
        //dml data
        //query data
        //assert data
        list<Account> aclist = new list<Account>();
        list<case> cclist = new list<case>();
        for(integer i=0;i<5;i++){
            account a = new account();
            a.Name = 'test'+i;
            aclist.add(a);
        }
        insert aclist;
        for(Account acc :aclist){
            case c = new case();
            c.Status = 'New';
            c.Origin = 'Phone';
            c.Product__c = 'GC1060';
            c.AccountId = acc.Id;
            cclist.add(c); 
            
        }
        test.startTest();
        insert cclist;
        test.stopTest();
        
        list<account> acccc = [select id,latestCaseNumber__c from Account where id=:aclist[0].id];
        list<case> caseList = [select id,CaseNumber from Case where id=:cclist[0].id];
        system.assertEquals(caseList[0].CaseNumber, acccc[0].latestCaseNumber__c);
        
    }
}