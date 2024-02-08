@isTest
public class DailyOppprsTest {
    @IsTest
    public static void oppProcess(){
        list<Opportunity> oppList = new list<Opportunity>();
        string CRON  = '0 0 0 ? * * *';
        
        for(Integer i=0;i<500;i++){
            if(i<250){
                opportunity op = new opportunity();
                op.Name = 'Test'+i;
                op.StageName = 'Prospecting';
                op.CloseDate = date.today();
                oppList.add(op);
                
            }else {
                opportunity op = new opportunity();
                op.Name = 'Test'+i;
                op.StageName = 'Prospecting';
                op.CloseDate = date.today();
                op.LeadSource = 'Other';
                oppList.add(op);
            }
        }
        insert oppList;
        test.startTest();
        string jobId = system.schedule('process Opportunities', CRON, new DailyOppProcesser());
        test.stopTest();
        
        list<Opportunity> updateOppList = [select Id,LeadSource 
                                           from Opportunity where 
                                           LeadSource = 'web'];
        system.debug(updateOppList);
        system.assertEquals(200, updateOppList.size());
        
        
        
        
        
        
        
    }
}