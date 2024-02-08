public class ContactTracingPersonController {
    //Generate unique Token for the moblie no
    public static string getToken(string mobileNo){
        Blob value = blob.valueOf(mobileNo);
        Blob hash = crypto.generateDigest('MD5', value);
        return Encodingutil.base64Encode(hash);
    }
    
    //query 100 records with recent health changes
    public static List<Person__c> getRecentHealthChanges(){
        return [SELECT Id, Name, Health_Status__c, Mobile__c, 
                Status_Update_Date__c, Token__c FROM Person__c 
                ORDER BY Status_Update_Date__c DESC NUllS LAST LIMIT 100];
    }
    //search person by its name for the query result
    public static List<person__c> searchPeople(string searchTerm){
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name, Health_Status__c, Mobile__c, 
                Status_Update_Date__c, Token__c FROM Person__c  
                WHERE Name LIKE :searchTerm
                OR Mobile__c LIKE :searchTerm 
                OR Token__c LIKE :searchTerm  
                ORDER BY Status_Update_Date__c DESC];
    }
    
    //get person by its Id
    public static person__c getPersonById(string personId){
        List<Person__c> person =  [SELECT Id, Name, Health_Status__c, Mobile__c, 
                                   Status_Update_Date__c, Token__c FROM Person__c  
                                   WHERE Id =: personId];
        if(person != Null && person.size() > 0){
            return person[0];
        }
        return null;
    }
    
    
}