@isTest
public class AccountTriggerTest {
    @isTest
    public static Void TestCreate200Records(){
        //Test Setup data
        //Create 200 new Accounts
        List<Account> acc = New List<Account>();
        for(Integer i=0;i<200;i++){
            Account acct = new Account(Name='Test Account'+i,BillingState ='CA');	
            acc.Add(acct);
        }
        Test.startTest();
        insert acc;
        Test.stopTest();
        List<Account> toup = [SELECT ShippingState From Account];
        for(Account a : toup){
            system.assertEquals('CA',a.ShippingState,'ERROR');
        }
    }
}