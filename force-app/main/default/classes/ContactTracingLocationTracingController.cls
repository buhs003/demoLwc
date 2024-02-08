//project class Location Tracing
public class ContactTracingLocationTracingController {
    //get visitor by location id
    public static List<Location_Tracing__c> getVisitors(string locationId){
        return [SELECT Id, Person__c, Location__c,Visit_Date__c,
                Person__r.Token__c,
                Person__r.Health_Status__c 
                FROM Location_Tracing__c 
                WHERE Id =:locationId ORDER BY Visit_Date__c DESC];
    }
    //get location Info by set of person ids
    public static List<Location_Tracing__c> getLocationsByPersonIds (Set<Id> personIds){
        return [SELECT Id, Person__c, Location__c
                FROM Location_Tracing__c WHERE Person__c 
                IN :personIds AND Visit_Date__c = LAST_N_DAYS : 10];
    }
    //get location info by set of location ids
    public static List<Location_Tracing__c> getLocationByLocationIds(Set<Id> locationIds){
        return [SELECT Id, Person__c, Location__c
                FROM Location_Tracing__c WHERE Location__c 
                IN :locationIds 
                AND Person__r.Health_Status__c ='Green' 
                AND Visit_Date__c = LAST_N_DAYS : 10];
    }
    
}