public with sharing class contactController {
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContact(Integer pageNumber,Integer pageSize){
    Integer offset = (pageNumber - 1) * pageSize;        
        return [SELECT Id, Name, Email, Phone FROM Contact ORDER BY Name ASC LIMIT :pageSize OFFSET :offset];

    }
    @AuraEnabled
    public static List<Contact> createContactRecord(string FirstName,string LastName,string Email){
        List<Contact> contoUpdateLsit = new  List<Contact>();
            contact con = new contact();
            con.FirstName = FirstName;
            con.LastName = LastName;
            con.Email = Email;
            contoUpdateLsit.add(con);
        if(!contoUpdateLsit.isEmpty()){
            insert contoUpdateLsit;
        }    
         return contoUpdateLsit;
       
    }
}