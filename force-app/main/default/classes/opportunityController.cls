public class opportunityController {
    public static void updateProfile(List<Id> oppids){
        for(Id oppId : oppids){
            //Get the opp records
            Opportunity op = [SELECT ID,Amount,Profile__c FROM Opportunity WHERE Id =:oppId];
            if(op.Amount<10000){
                op.Profile__c='Low';
            }else if(op.Amount>50000){
                op.Profile__c='High';
            }else{
                op.Profile__c='Medium';
            }
            update op;
        }
    }
}