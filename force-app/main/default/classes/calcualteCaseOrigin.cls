public class calcualteCaseOrigin {
    @future
    public static void countcaseBasedonorigin(list<id> accIds){
        list<Account> accList = [select id,cases_through_email__c,
                                 cases_through_phone__c,
                                 cases_through_web__c,
                                 (select id,origin 
                                  from cases) from 
                                 account where id IN :accIds];
        for(Account ac :accList){
            Integer email=0,web=0,phone=0;
            
            for(case cs :ac.cases){
                if(cs.Origin == 'Phone'){
                    phone++;
                }else if(cs.Origin == 'web'){
                    web++;
                }else if(cs.Origin == 'Email'){
                    email++;
                }
                
            }
            ac.cases_through_email__c = email;
            ac.cases_through_phone__c = phone;
            ac.cases_through_web__c = web;
        }
        if(!accList.isEmpty()){
            update accList;
        }
        
    }
    
}