public class PreventDelAccountHandler {
    public static void PreventDelAccount(list<account> oldrecords){
         set<id> allAccIds = new set<id>();
            for(Account acc :oldrecords){
                allAccIds.add(acc.Id);
            }
            Set<Id> Check = new Set<Id>();
            List<Opportunity> acc = [SELECT Id,StageName,AccountId
                                     FROM Opportunity where StageName = 'Closed Won' AND AccountId in :allAccIds];
            for(Opportunity op :acc){
                Check.add(op.AccountId);
            }
            for(Account a : oldrecords){
                if(check.contains(a.id)){
                    a.addError('Account cannot be deleted...!');
                }
            }
    }
}