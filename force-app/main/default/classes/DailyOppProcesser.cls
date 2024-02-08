public class DailyOppProcesser implements schedulable{
    public void execute (schedulableContext sc){
        list<Opportunity> oppList = [select id,leadSource from Opportunity
                                     where LeadSource = null limit 200];
        for(Opportunity opp :oppList){
            opp.LeadSource = 'Web';
        }
        if(!oppList.isEmpty()){
            update oppList;
        }
    }
}