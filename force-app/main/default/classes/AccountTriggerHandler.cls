public class AccountTriggerHandler {
    public static void updaterelatedopp(List<Account> acRec){
        list<opportunity> opList = new list<opportunity>();
        for(Account a :acRec){
            opportunity o = new opportunity();
            o.Name = a.Name;
            o.closeDate = system.today();
            o.StageName = 'Prospecting';
            o.AccountId = a.Id;
            opList.add(o);
        }
        if(!opList.isEmpty()){
            insert opList;
        }
    }
    public static void updaterelatedContact(list<Account> newAcrecords){
        list<contact> cons = new list<contact>();
        for(Account ac :newAcrecords){
            contact c = new contact();
            c.FirstName = 'Test FirstName';
            c.LastName = 'LastName'+ac.Name;
            c.AccountId = ac.id;
            cons.add(c);
                
        }
        if(!cons.isEmpty()){
            insert cons;
        }
        
    }
    public static void copyBillingtoShipping(list<Account> newacc){
        list<Account> acclist = new list<account>();
        for(account ac :newacc){
            if(ac.Match_Billing_Address__c == true && ac.BillingCity !=null){
                ac.ShippingStreet = ac.BillingStreet;
                ac.ShippingState = ac.BillingState;
                ac.ShippingPostalCode = ac.BillingPostalCode;
                ac.ShippingCountry = ac.BillingCountry;
                ac.ShippingCity = ac.BillingCity;
            }
        }
        
    }
    public static void updateRating(list<account> newaccRecords){
         list<account> acclist = new list<account>();
            for(account acc :newaccRecords){
                if(acc.Industry == 'Media' || acc.Industry == 'Energy'){
                    acc.Rating = 'Hot';
                    acclist.add(acc);
                }
            }
    }
  //  public static void CreateAccounts(List<Account> accrecOrds){
    //    for(Account acc : accrecOrds){
     //       if(acc.ShippingState != acc.BillingState){
     //           acc.ShippingState = acc.BillingState;
                
     //       }
      //  }
        
   // }
}