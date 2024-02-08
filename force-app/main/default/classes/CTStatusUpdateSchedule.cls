public class CTStatusUpdateSchedule implements Schedulable {
public static final string CRON = '0 0 3 * * ?';
    public void execute(SchedulableContext sc){
        CTUpdatePersonStatusBatch updatePersonStatusBatch = new CTUpdatePersonStatusBatch();
        dataBase.executeBatch(updatePersonStatusBatch, 2000);
    }
}