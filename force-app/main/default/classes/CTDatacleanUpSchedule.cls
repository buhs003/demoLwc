public class CTDatacleanUpSchedule implements Schedulable{
    public static final string CRON = '0 0 2 * * ?';
    public void execute(schedulableContext sc){
        CTPeopleTracingDataCleanupBatch peopleTracingBatch = new CTPeopleTracingDataCleanupBatch();
        database.executeBatch(peopleTracingBatch, 2000);
    }
}