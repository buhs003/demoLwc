public class statusbatchController {
    @AuraEnabled(cacheable=true)
    public  static AsyncApexJob getBatchStatus(String asyncJobId) {
        return [SELECT Id, Status FROM AsyncApexJob WHERE Id = :asyncJobId];
    }
}