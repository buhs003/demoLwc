@isTest
public class TestSGupdateSerialNoOnOppoLineItem {
    @isTest
    public static void testbeforeInsert(){
        list<product2> allPrd = new list<product2>();
        product2 prd = new product2(Name= 'shubham product');
        product2 prd1 = new product2(Name= 'Shubhangis product');
       
        allPrd.add(prd);
        allPrd.add(prd1);
        insert allPrd;
        
        list<opportunityLineItem> alloppLinItm = [SELECT Id, OpportunityId, Name, Serial_No__c FROM OpportunityLineItem];
        if(alloppLinItm.size()>0){
            for(opportunityLineItem allopprecords :alloppLinItm){
                
            }   
        }
        
    }
}