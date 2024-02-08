public class handelAccounttrailheadoppcreate {
    public static void createNewopp(List<Account> newAcc){
        for(Account acc : newAcc){
            
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name + 'Opportunity';
            opp.AccountId = acc.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today().addMonths(1);
            insert opp;
        }
        
    }
}