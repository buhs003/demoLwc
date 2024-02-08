public class contactClone implements queueable{
    private contact con;
    private string industryValue;
    
    public contactClone(contact con,string industryValue){
        this.con = con;
        this.industryValue = industryValue;
    }
    public void execute(QueueableContext context){
        list<Account> accList = [select Id,Name from account
                         where Industry =:industryValue limit 200];
        list<contact> conList = new list<contact>();
        
        for(Account acc :accList){
            contact c = con.clone(false,false,false,false);
            c.AccountId = acc.Id;
            conList.add(c);
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }
}