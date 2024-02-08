@isTest
public class opportunityTriggerHandlerTest {
    @isTest
    public static void updateOpportunitydescriptionTest(){
        //create sample Data
        //apply the dml
        //query the data 
        //use assert
        
        list<opportunity> opplist = new list<opportunity>();
        for(integer i=0;i<5;i++){
            opportunity o = new opportunity();
            o.Amount = 200000;
            o.stageName = 'Prospecting';
            o.CloseDate = date.today();
            o.Name = 'Test Opportunity'+i;
            opplist.add(o);
        }
        test.startTest();
        insert opplist;
        test.stopTest();
        
        list<opportunity> updatedOpplist = [select id,Description from opportunity where id=:opplist[0].id];
        
        system.assertEquals('Hot Opportunity', updatedOpplist[0].Description);
    }
}