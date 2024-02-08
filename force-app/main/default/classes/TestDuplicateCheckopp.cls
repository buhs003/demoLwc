@istest
public class TestDuplicateCheckopp {
    @isTest
    public static void TestDuplicatebeforeinsertOpportunity(){
        
        account acc = new account(name='test account 1');
        insert acc;
        
        list<opportunity> oppList = new list<opportunity>();
        oppList.add(new opportunity(AccountId = acc.Id,Name='Test Opp',StageName = 'Prospecting',CloseDate = date.today()));
        oppList.add(new opportunity(AccountId = acc.Id,Name='Test Opp',StageName = 'Prospecting',CloseDate = date.today()));
        
        insert oppList;
        
       list<opportunity> opp = [select id,name,AccountId,Account.Name from opportunity];
        for(opportunity opptocheck :opp){
            if(opptocheck.Account.Name == 'test account 1' && opptocheck.Name != 'Test Opp'){
                system.assertEquals('Duplicate Record:-->Test Opp', opptocheck.Name);
                
            }
        }
        system.assertEquals(2, opp.size());
    }
}