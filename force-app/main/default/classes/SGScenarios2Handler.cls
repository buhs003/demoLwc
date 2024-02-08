public class SGScenarios2Handler {
    public static void afterupdate(list<account> newrecords){
        
        set<id> acIds = new Set<id>();
        for(account ac :newrecords){
            acIds.add(ac.Id);
        }
        list<opportunity> toupdate = new list<opportunity>();
        
        list<opportunity> oplist = [select id,accountId,stageName,CreatedDate
                                           from opportunity where CreatedDate = last_n_days :30 
                                           and stageName != 'closed won' and accountId In :acIds];
        for(opportunity op :oplist){
            op.StageName = 'Closed Lost';
            op.closeDate = date.today();
            toupdate.add(op);
        }
        if(toupdate.size()>0){
            update toupdate;
        }
    }
}