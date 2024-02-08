@isTest
public class updateParentAccountTest {
    @TestSetup
    public static void setup(){
        list<account> accList = new list<Account>();
        
        accList.add(new Account(name = 'Parent'));
        
        for(integer i=0;i<100;i++){
            accList.add(new account(Name='Test account'+i));
        }
        insert accList;
    }
    @istest
    private static void testQueuable(){
        id parentId = [Select Id From Account where Name='Parent'][0].Id;
        
        list<Account> accList = [select Id,name From account where name Like 'Test Account%'];
        //passed the parameter in the queueable constructor.
        updateParentAccount updateJob = new updateParentAccount(accList, parentId);
        test.startTest();
        system.enqueueJob(updateJob);
        test.stopTest();
        
        system.assertEquals(100, [select count() from account where parentId = :parentId ]);
    }
}