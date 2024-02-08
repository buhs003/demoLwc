@isTest
public class oppProcessBatchTest {
    @isTest
    private static void testBatchclass(){
        list<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=0;i<200;i++){
            opportunity opp  = new opportunity();
            opp.Name = 'Test Opportunity' + i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = date.today();
            oppList.add(opp);
        }
        insert oppList;
        test.startTest();
        oppProcessorBatch oppproc = new oppProcessorBatch();
        id batchId = database.executeBatch(oppproc);
        test.stopTest();
        
        list<opportunity> allopps = [select id,leadSource from opportunity where leadSource = 'web'];
        
        system.assertEquals(200, allopps.size());
        
    }
}