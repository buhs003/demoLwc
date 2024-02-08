trigger accountTrigger on Account (after insert,after update,before insert) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
            AccountTriggerHandler.updateRating(trigger.new);
            AccountTriggerHandler.copyBillingtoShipping(trigger.new);
        }
        when AFTER_INSERT{
            AccountTriggerHandler.updaterelatedContact(trigger.new);
            AccountTriggerHandler.updaterelatedopp(trigger.new);
            
            
            map<Id,Decimal> mapAcc = new map<Id,Decimal>();
            List<Contact> conList = new List<Contact>();
            for(Account a :trigger.new){
                if(a.Industry == 'Banking'){
                    //for(integer i=0;i<=4;i++){
                    Contact c = new Contact();
                    c.AccountId = a.Id;
                    c.lastName = a.Name;
                    c.Phone = a.Phone;
                    conList.add(c);
                    //  }
                }
                if(a.NumberofLocations__c != null){
                    mapAcc.put(a.Id, a.NumberofLocations__c);
                }
                if(mapAcc.size()>0 && mapAcc!=null){
                    
                }
                
            }
            for(Id accId :mapAcc.keySet()){
                for(integer i=0;i<mapAcc.get(accId);i++){
                    contact newContact = new contact();
                    newContact.AccountId = accId;
                    newContact.lastName = 'Contact'+i;
                    conList.add(newContact);
                }
            }
            if(conList.size()>0 && conList!=null)
                insert conList;
        }
        when AFTER_UPDATE{
            system.debug('Inside After update account trigger');
            //adding the accounts id which is update 
            set<ID> accId = new set<Id>();
            for(Account ac :trigger.new){
                accId.add(ac.id);
            }
            system.debug('accId'+accId);
            //quering all the opp for related acc
            list<Opportunity> opplist = [select id ,StageName ,CreatedDate FROM Opportunity where AccountId IN :accId];
            //updating the opp that meet the criteria
            list<opportunity> opptoupdate = new list<opportunity>();
            
            for(opportunity op :opplist){
                //created date should be greated than 30 days from today
                if(op.createdDate.addDays(30)<Date.today() && op.stageName != 'Closed Won'){
                    op.StageName = 'Closed Lost';
                    opptoupdate.add(op);
                }
                
            }
            system.debug('opptoupdate'+opptoupdate);
            if(opptoupdate!=null){
                update opptoupdate;
            }
        }
        
    }
    
}