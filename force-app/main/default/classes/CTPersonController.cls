public class CTPersonController {
    public static String getToken(String mobileNo){
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);
        return EncodingUtil.base64Encode(hash);
    }
    public static List<Person__c> getRecentHealthChanges(){
        return [SELECT Id, Name, Health_Status__c, 
                Mobile__c, Status_Update_Date__c, Token__c 
                FROM Person__c Order 
                By Status_Update_Date__c 
                DESC NULLS LAST LIMIT 100];
    }
    public static List<Person__c> searchPeople(String searchTerm){
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name, Health_Status__c, 
                Mobile__c, Status_Update_Date__c, Token__c 
                FROM Person__c WHERE Name Like :searchTerm OR 
                Mobile__c Like :searchTerm OR 
                Token__c Like :searchTerm
                Order By Status_Update_Date__c 
                DESC NULLS LAST];
    }
    public static Person__c getPersonById(String PersonId){
        List<Person__c> allPeoples = [SELECT Id, Name, Health_Status__c, 
                                      Mobile__c, 
                                      Status_Update_Date__c, 
                                      Token__c FROM Person__c WHERE Id =:PersonId];
        if(allPeoples != Null && allPeoples.Size() > 0){
            return allPeoples[0];
        }
        return null;
    }
}