public class oppProcesserScheduler implements schedulable {
    public static final string CRON = '0 0 2 * * ?';
    
    public void execute(schedulablecontext sc){
        
        oppProcessorBatch oppprocesser = new oppProcessorBatch();
        
        database.executeBatch(oppprocesser);
    }
}