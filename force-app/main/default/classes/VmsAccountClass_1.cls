//Search parameter in apexc
public with sharing class VmsAccountClass_1 {
@AuraEnabled(cacheable=true)
public static list<Account> getAccountList(){
    return [SELECT  Id, Name, Phone, Industry, BillingCountry, Website FROM Account];
}
@AuraEnabled(cacheable=true)
public static List<Account> searchAccountrecord(string searchKey){
string key = '%'+searchKey+'%';
    return [SELECT  Id, Name, Phone, Industry, BillingCountry, Website  FROM Account where Name like :key];

}
@AuraEnabled(cacheable=true)
public static List<Account> delAccount(string delId){
    return [select id from account where id=:delId];
}
@AuraEnabled(cacheable=true)
public static List<Account> getPrimaryContact(string recId){
    List<Account> acclist = [select Id, (select id,Name,Phone,Email from contacts) from Account where id=:recId];
    if(!acclist.isEmpty()){
        return acclist;
    }
    return null;
}
@AuraEnabled(cacheable=true)
public static List<Contact> getContactList(string delId){
    return  [select id,AccountId,name,Phone,Email from contact];
}

@AuraEnabled(cacheable=true)
public static Map<Id,String> getRelatedFilesByRecordId(string recordId){
    List<ContentDocumentLink> files = [select ContentDocumentId from ContentDocumentLink where LinkedEntityId =:recordId];
    List<Id> filesIds = new List<Id>();
        for(ContentDocumentLink docLink :files){
            filesIds.add(docLink.ContentDocumentId);
        }   
        List<ContentVersion> docs = [SELECT ContentDocumentId, FileExtension, Title  
                                     FROM ContentVersion WHERE ContentDocumentId IN : filesIds];
        Map<ID, String> mapIdTitle = new Map<ID, String>();
        for (ContentVersion docLink : docs) {
                mapIdTitle.put(docLink.ContentDocumentId, docLink.Title);
        }
        return mapIdTitle;
    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getVmsOpportunityList(){
       List<Opportunity> OppList = new List<Opportunity>();

       List<Opportunity> getVmsOpportunityList = [SELECT Id, 
       TrackingNumber__c, OrderNumber__c, CurrentGenerators__c, 
       MainCompetitors__c, Delivery_Installation_Status__c, Profile__c, 
       INR_Value__c, DeliveryInstallationStatus__c FROM Opportunity];
       for(Opportunity Opp :getVmsOpportunityList){
        OppList.add(opp);
       }
       return OppList;

    }
    @AuraEnabled(cacheable = true)
    public static list<Opportunity> searchRecordForOpp(string searchKey) { 
        //Id vendorRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Vendor').getRecordTypeId();
        string searchWord = '%'+searchKey+'%' ;
        list<Opportunity> oppList = new list<Opportunity>();
        for(Opportunity op:[SELECT  Id, Name, Description, StageName, Amount, CloseDate FROM Opportunity
                         WHERE Name LIKE: searchWord]){
                            oppList.add(op);  
                             system.debug(oppList);
                         } 
        
        return oppList; 
    }
    @AuraEnabled(cacheable = true)
    public static string loadOppData(Id contentDocumentId){
String strOppMessage;
List<Opportunity> op = new List<Opportunity>();
if(contentDocumentId !=null){

    ContentVersion contentVersionObj = [ SELECT Id, 
            VersionData FROM ContentVersion
             WHERE ContentDocumentId =:contentDocumentId ];

             List < String > records = contentVersionObj.VersionData.toString().split('\n' );
             records.remove( 0 );

             for(string rec :records){
                if(rec != null){
                    Opportunity objOpp = new Opportunity();

                    List<String> row = rec.split(',');
                    system.debug('row'+row);

                    objOpp.Name = row[ 0 ];
                    system.debug('Name'+objOpp.Name);

                    objOpp.Profile__c = row[ 1 ];
                    system.debug('Profile'+objOpp.Profile__c);

                    objOpp.DeliveryInstallationStatus__c = row[ 2 ];
                    system.debug('DeliveryStatus'+objOpp.DeliveryInstallationStatus__c);

                    objOpp.StageName = row[ 3 ];
                    system.debug('StageName'+objOpp.StageName);

                    objOpp.Amount = Decimal.valueOf(row[ 4 ]);
                    system.debug('Amount'+objOpp.Amount);

                    objOpp.CloseDate = date.valueOf(row[ 5 ]);
                    system.debug('ClosedDate'+objOpp.CloseDate);

                    objOpp.Type = row[ 6 ];
                    system.debug('Type'+objOpp.Type);

                    objOpp.LeadSource = row[ 7 ];
                    system.debug('LeadSource'+objOpp.LeadSource);

                    objOpp.Id = objOpp.ID;
                    op.add( objOpp );

                }
             }
             if(op.size()>0){
                insert op;

                Database.DeleteResult deleteResult = Database.delete( contentDocumentId, true );  
                strOppMessage = 'Records loaded successfully';
             }
        }
        return strOppMessage;
    }
   
}