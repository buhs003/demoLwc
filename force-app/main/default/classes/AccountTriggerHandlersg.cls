public class AccountTriggerHandlersg {
    public static void updateRating(list<account> accrec){
        for(Account ac :accrec){
            if(ac.Industry!=null && ac.Industry == 'Media'){
                ac.Rating = 'Hot';
            }
        }
    }
    public static void updateAddress(list<Account> accrec){
        for(Account ac :accrec){
            if(ac.CopyBillingToShipping__c == True){
                ac.ShippingStreet = ac.BillingStreet;
                ac.ShippingState = ac.BillingState;
                ac.ShippingCountry = ac.BillingCountry;
            }
        }
    }
    //Set OWD as Private for Account. Once an Account record is created, it
    //should be automatically shared with any one user who belongs to Standard
    //User profile
    public static void shareAccWithStdUser(list<Account> accList){
        
        //standard user id by query on profile
        Id standarduserid = [select id from profile where 
                             name='Standard User'].id;
        //User with matching profile id and isactive 
        list<user> listofuserid = [select id from user where profileId=:standarduserid
                                   and isActive = true limit 1];
        
        list<Accountshare> accsharelist = new list<Accountshare>();
        
        for(account acc :accList){
            AccountShare ashare = new AccountShare();
            ashare.UserOrGroupId = listofuserid[0].id;
            ashare.AccountId = acc.id;
            ashare.RowCause = 'Manual';
            ashare.AccountAccessLevel = 'Edit';
            ashare.OpportunityAccessLevel = 'Edit';
            accsharelist.add(ashare);
        }
        if(!accsharelist.isEmpty()){
            system.debug('accsharelist'+accsharelist);
            insert accsharelist;
        }
        
    }
    public static void changeOwner
        (list<Account> accList,map<id,Account> oldRecmap){
            list<contact> conList = new list<contact>();
            map<id, Account> acctoAccountMap = new  map<id, Account>();
        
            for(account acc :accList){
                if(acc.OwnerId!=oldRecmap.get(acc.id).OwnerId){
                    acctoAccountMap.put(acc.id,acc);
                }
            }
            for(contact con :[select AccountId,ownerId from
                              contact where AccountId
                              in :acctoAccountMap.keyset()]){
                                  con.OwnerId = acctoAccountMap.get(con.AccountId).ownerId;
                                  conList.add(con);
                              }
            if(!conList.isEmpty()){
                update conList;
            }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
}