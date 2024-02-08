public class OpportunityTriggersgHandler {
    public static void updateDec(list<opportunity> oppList){
        for(opportunity op :oppList){
            if(op.amount!=null && op.amount >= 100000){
                op.Description = 'Hot Opportunity';
            }
        }
    }
}