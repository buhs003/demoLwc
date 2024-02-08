public class opportunityTriggerHandler {
    public static void updateOpportunitydescription(list<opportunity> newoppRecords){
        list<opportunity> opplist = new list<opportunity>();
        for(opportunity op :newoppRecords){
            if(op.Amount != null && op.Amount>100000  && op.Amount<500000){
                op.Description = 'Hot Opportunity';
            }
        }
        
    }

}