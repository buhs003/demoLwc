public class EmailTemplateHelper {
    public static Id getEmailTemplateIdByTempName(String emailTemplateApiName) {
        EmailTemplate template = [SELECT Id FROM EmailTemplate WHERE DeveloperName = :emailTemplateApiName];
        system.debug('template'+template);
        return template.Id;
        
    }
}