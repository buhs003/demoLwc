public class updateParentAccount implements Queueable{
    public list<account> accList;
    public Id parentAccId;
    
    public updateParentAccount(list<Account> accRecords,Id id){
        this.accList = accRecords;
        this.parentAccId = id;
    }
    public void execute(QueueableContext qc){
        for(Account acc :accList){
            acc.ParentId = parentAccId;
        }
        update accList;
    }
}