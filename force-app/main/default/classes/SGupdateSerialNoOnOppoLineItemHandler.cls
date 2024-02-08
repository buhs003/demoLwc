public class SGupdateSerialNoOnOppoLineItemHandler {
    public static void beforeInsert(list<OpportunityLineItem> newrecords){
        map<id,string> mapofopIdandsrNo = new  map<id,string>();
        set<Id> opIds = new set<id>();
        for(OpportunityLineItem opLineItems : newrecords){
            opIds.add(opLineItems.OpportunityId);
        }
        list<OpportunityLineItem> oplinItmallfields = [SELECT Id, OpportunityId, Name, 
                                                       Serial_No__c FROM OpportunityLineItem
                                                       where OpportunityId IN :opIds];
        list<OpportunityLineItem> incSrno = new list<OpportunityLineItem>();
        if(oplinItmallfields.size()>0){
            for(OpportunityLineItem oppprd :oplinItmallfields){
                if(oppprd.Serial_No__c != null){
                    //get the last no of the Serial_No__c field
                    string lastWord = oppprd.Serial_No__c.right(1);
                    integer num = integer.valueOf(lastWord);
                    num++;
                    //apending the incremented number
                    oppprd.Serial_No__c = oppprd.Serial_No__c+','+(num);
                    incSrno.add(oppprd);
                    //adding it to map so that we can change for the opportunitylineitem which is newly getting inserted
                    mapofopIdandsrNo.put(oppprd.OpportunityId,oppprd.Serial_No__c );
                }
                else{
                    //if the serialfield is null then it means there is no opportunitylineitem present so bydefault we are passing 1
                    oppprd.Serial_No__c = '1';
                    incSrno.add(oppprd);
                }
            }
        }
        if(incSrno.size()>0){
            update incSrno;
        }
        for(OpportunityLineItem oppnewrec :newrecords){
            //checking if the opportunityId of the newly inserting oppLineitm is present in the map
            //if present we are passing that serialno to the newly inserting opportunitylineitem else we are just adding 1 because it is the first opportunityitem getting added
            if(mapofopIdandsrNo.containskey(oppnewrec.OpportunityId)){
                oppnewrec.Serial_No__c = mapofopIdandsrNo.get(oppnewrec.OpportunityId);
            }
            else{
                oppnewrec.Serial_No__c = '1'; 
            }
        }
    }
}