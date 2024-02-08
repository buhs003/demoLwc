public class CreateOpportunityAccountCreatedHandlar {
    public static void createOpprtunityAccountCreatedHandler(List <Account> newRecords){
        list<opportunity> oppstoupdate = new list<opportunity>();
        for(Account acc :newRecords){
            Opportunity op = new Opportunity();
            op.AccountId = acc.Id;
            op.Name = acc.Name;
            op.CloseDate = Date.today();
            op.StageName = 'Prospecting';
            oppstoupdate.add(op);
        }
        if(!oppstoupdate.isEmpty()){
            insert oppstoupdate;
        }
    }
}