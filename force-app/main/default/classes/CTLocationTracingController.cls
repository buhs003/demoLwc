public class CTLocationTracingController {
    
    public static List<Location_Tracing__c> getVistors(String locationId){
        return [SELECT Id, Visit_Date__c, Location__c, Person__c,
                Person__r.Health_Status__c,
                Person__r.Token__c FROM Location_Tracing__c 
                WHERE Id =: locationId
                ORDER BY Visit_Date__c DESC ];
    }
    public static List<Location_Tracing__c> getLocationsByPersonIds(set<Id> personIds){
        return [SELECT Id,  Location__c, Person__c
                FROM Location_Tracing__c 
                WHERE Person__c IN :personIds
                AND Visit_Date__c = LAST_N_DAYS:10];
    }
    public static List<Location_Tracing__c> getLocationByLocationIds (Set<Id> locationIds){
        return [SELECT Id,  Location__c, Person__c
                FROM Location_Tracing__c 
                WHERE Location__c IN :locationIds AND
                Person__r.Health_Status__c = 'Green'
                AND Visit_Date__c = LAST_N_DAYS:10];
            }
}