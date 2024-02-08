@isTest
public class AccountTriggerHandlerTest {
    @isTest
    public static void updaterelatedoppTest(){
        //create sample data
        //dml the data
        //query the data
        //assert it
        list<account> alist = new list<account>();
        for(Integer i=1;i<5;i++){
            account a = new account();
            a.Name = 'Test'+i;
            alist.add(a);
        }
        Test.startTest();
        insert alist;
        Test.StopTest();
        
        list<opportunity> oppList = [select id from opportunity where AccountId =:alist[0].id];
        system.assert(oppList!=null, 'Opp is not Created');
    }
    @isTest
    public static void updaterelatedContact(){
        //create sample date 
        //create and apply dml
        //then we need to query the record
        //then apply assert
        list<account> alist = new list<account>();
        for(Integer i=1;i<5;i++){
            account a = new account();
            a.Name = 'Test'+i;
            alist.add(a);
        }
        Test.startTest();
        insert alist;
        Test.StopTest();
        
        list<contact> conList = [select id from contact where AccountId =:alist[0].id];
        system.assert(conList!=null, 'Contact is not Created');
        
        
    }
    @isTest
    public static void updateRatingTest(){
        //create sample data
        //then we need to apply dml
        //then we need to query the record
        //then apply assert
        list<account> acc = new list<account>();
        for(Integer i=1;i<5;i++){
            account a = new account();
            a.Name = 'Test'+i;
            a.Industry = 'Energy';
            acc.add(a);
        }
        Test.startTest();
        insert acc;
        Test.StopTest();
        
        
        List<Account> updatedAcclist = [select id ,Rating from account where Id=:acc[0].Id];
        
        system.assertEquals('Hot', updatedAcclist[0].Rating);
        
    }
    @isTest
    public static void copyBillingtoShippingTest(){
        //create the records
        //perform dml
        //query the record 
        //use assert
        list<account> aList = new list<account>();
        for(integer i=0;i<5;i++){
            account acc = new account();
            acc.Name = 'Test Account Address'+i;
            acc.Match_Billing_Address__c = true;
            acc.BillingStreet='Teststreet';
            acc.BillingState='Teststate';
            acc.BillingPostalCode='1234';
            acc.BillingCountry='Testcountry';
            acc.BillingCity='TestCity';
            aList.add(acc);
        }
        test.startTest();
        insert aList;
        system.debug('aList'+aList);
        test.stopTest();
        
        list<Account> updatedacc = [select Id, ShippingStreet from account where Id=:aList[0].Id];
        system.debug('updatedacc'+updatedacc);
        
        
        system.assertEquals('Teststreet', updatedacc[0].ShippingStreet);
        
    }
}