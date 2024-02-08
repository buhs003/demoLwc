public class SendEmailBatch implements Database.Batchable<SObject>, Database.Stateful {
    private String query;
    
    public SendEmailBatch(String query) {
        this.query = query;
    }
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Name, Email, RecordTypeId,RecordType.Name FROM Contact');
    }
    
    public void execute(Database.BatchableContext bc, List<SObject> scope) {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        for (Contact contact :(List<Contact>)scope) {
            try{
                String recordTypeName = contact.RecordType.Name;
                system.debug('recordTypeName'+recordTypeName);
                String emailTemplateApiName = null;
                if (recordTypeName == 'Non Technical') {
                    emailTemplateApiName = 'Non_Technical_Contact';
                } else if (recordTypeName == 'Technical') {
                    emailTemplateApiName = 'Technical_Contact';
                } else {
                    // Default email template
                    emailTemplateApiName = 'Default_Email_Template';
                }
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new List<String>{contact.Email});
                email.setTargetObjectId(contact.Id);
                email.setTemplateId(EmailTemplateHelper.getEmailTemplateIdByTempName(emailTemplateApiName));
                emails.add(email);  
            }catch(Exception e){
                
            }
        }
        Messaging.sendEmail(emails);
    }
    public void finish(Database.BatchableContext BC) {
        // Do nothing
    }
}