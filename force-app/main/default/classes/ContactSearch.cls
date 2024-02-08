public class ContactSearch {
    public static List<Contact> searchForContacts(String conname,String conpost){
        list<Contact> cc =[SELECT Id,Name FROM Contact WHERE lastName=:conname AND MailingPostalCode=:conpost];
        system.debug(cc);
        return cc;
    }
    @AuraEnabled(cacheable = true)
    public static list<contact> getContacts(){
        return [select id ,Name from Contact];
    }
}