public class OppSharing {
    public static void shareOpp(List<Opportunity> oppList ){
        List<OpportunityShare> oppShareList = new List<OpportunityShare>();
        
        User usr = [Select Id, name from user limit 1];//i will be querying the user involved in real code
        
        for(Opportunity opp : oppList) {
            OpportunityShare oppShare = new OpportunityShare();
            
            oppShare.OpportunityAccessLevel = 'Edit';
            oppShare.OpportunityId = opp.Id;
            oppShare.UserOrGroupId = usr.Id;
            oppShareList.add(oppShare);
            
        }
        
        insert oppShareList;
    }
}