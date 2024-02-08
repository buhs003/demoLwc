public class EmailManagerTest {
    //public method
    public static void sendMail(string address,string subject,string body){
        //create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        string[] toAddresses = new string[]{address};
            mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        //pass this email message to the built-in sendemail method
        //of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}