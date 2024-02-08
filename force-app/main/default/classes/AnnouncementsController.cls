public with sharing class AnnouncementsController {
    @AuraEnabled(cacheable=true)
    public static List<Announcement__c> getAnnouncements() {
      return [SELECT Id, Text__c, Type__c, Date__c FROM Announcement__c ORDER BY Date__c DESC];
    }
  
    @AuraEnabled
    public static void saveAnnouncement(String text, String type) {
      Announcement__c newAnnouncement = new Announcement__c();
      newAnnouncement.Text__c = text;
      newAnnouncement.Type__c = type;
      newAnnouncement.Date__c = Date.today();
      insert newAnnouncement;
    }
}