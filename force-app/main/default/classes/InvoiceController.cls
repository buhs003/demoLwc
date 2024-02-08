public with sharing class InvoiceController {
    @AuraEnabled(cacheable=true)
    public static List<InvoiceDetails__c> invoiceHandler(string recId){
    return [SELECT Id,
        Fee_Deposited__c, InvoiceNo__c, InvoiceCreatedDate__c,
        InvoiceDueDate__c, CompanyName__c, Address1__c, Address2__c, CompanyUrl__c, 
        Company_Phone__c, CoustomerName__c, CoustomerEmail__c, CoustomerPhone__c, CoustomerAddress__c, 
         CourseMedium__c, Extended_Months__c, Course_Area__c, Amount_Area__c, Total_Amount__c FROM InvoiceDetails__c where Id=:recId];
    }
}