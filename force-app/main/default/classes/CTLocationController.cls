public class CTLocationController {
    public static List<Location__c> getRecentStatusChanges(){
        return [SELECT Id, Name, Address__c, 
                Pincode__c, Red_Score__c, 
                Status_Update_Date__c, Status__c 
                FROM Location__c ORDER BY 
                Status_Update_Date__c DESC NULLS LAST 
                LIMIT 100];
        
    }
    public static List<Location__c> searchLocations(String searchTerm){
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name, Address__c, 
                Pincode__c, Red_Score__c, 
                Status_Update_Date__c, Status__c 
                FROM Location__c WHERE Name Like :searchTerm OR Pincode__c 
                Like :searchTerm OR Address__c Like :searchTerm ORDER BY 
                Status_Update_Date__c DESC NULLS LAST];
    }
    public static Location__c getLocationById(String locationId){
        List<Location__c> allLocations = [SELECT Id, Name, Address__c, 
                                          Pincode__c, Red_Score__c, 
                                          Status_Update_Date__c, Status__c 
                                          FROM Location__c WHERE Id =:locationId];
        if(allLocations != Null && allLocations.size() > 0){
            return allLocations[0];
        }
        return Null;
    }
    
}