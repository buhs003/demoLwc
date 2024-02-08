@Istest
public class oppProcesserSchedulerTest {
    @Istest
    public static void oppProcesserTest(){
        list<opportunity> oppList = new list<opportunity>();
        for(integer i=0;i<100;i++){
            opportunity op = new opportunity();
            op.name = 'Test opportunity'+i;
            op.StageName = 'prospecting';
            op.CloseDate = date.today();
            oppList.add(op);
        }
        insert oppList;
        
        test.startTest();
        oppProcesserScheduler oppsched = new oppProcesserScheduler();
        string jobId = system.schedule('opp Processer batch', oppProcesserScheduler.CRON, oppsched);
        test.stopTest();
        
        list<opportunity> opps = [select id from opportunity where leadSource = 'web'];
        
        system.assertEquals(100, [select count() from opportunity]);
        
    }
}