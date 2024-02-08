@isTest
public class OppProcessorTest {
    @isTest
    public static void testBatchClass(){
        list<Opportunity> oppList = new list<Opportunity>();
        for(Integer i=0;i<200;i++){
            oppList.add(new opportunity(Name='Test Opportunity'+i,StageName='Prospecting',CloseDate=system.today()));
        }
        insert oppList;
        
        test.startTest();
        OpportunityProcessor oppProcess = new OpportunityProcessor();
        Id jobId = Database.executeBatch(oppProcess,200);
        test.stopTest();
        
        list<opportunity> updatedopps = [Select Id From opportunity where leadSource = 'web'];
        system.assertEquals(200, updatedopps.size());
    } 
}