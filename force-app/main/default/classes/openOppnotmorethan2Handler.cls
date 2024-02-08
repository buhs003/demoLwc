public class openOppnotmorethan2Handler{
    public static void beforeInsertHand(list<opportunity> newrecords){
        set<Id> oppIds = new set<Id>();
        for(opportunity opp :newrecords){
            oppIds.add(opp.AccountId);
        }
        list<opportunity> allOpps = [SELECT Id,StageName FROM Opportunity 
                                     Where (StageName!='Closed Won' 
                                            AND StageName!='Closed Lost') 
                                     AND AccountId In:oppIds];
        map<Id,list<Opportunity>> OppMap  = new map<Id,list<Opportunity>>();
        for(opportunity oppList :allOpps){
            OppMap.put(oppList.Id,allOpps);
        }
        for(opportunity newopp :newrecords){
            if(OppMap.keySet().size()>1)
                newopp.addError('Cannot Insert New Opp As it has allready 2 open opportunities');
        }
    }
}