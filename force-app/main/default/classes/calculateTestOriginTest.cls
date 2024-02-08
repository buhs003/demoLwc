@isTest
public class calculateTestOriginTest {
    @isTest
    public static void countCasestest(){
        list<Account> accList = new list<Account>();
        for(Integer i=0;i<=5;i++){
            account ac = new account();
            ac.Name = 'Test Account'+i;
            accList.add(ac);
        }
        insert accList;
        list<case> csList = new list<case>();
        list<id> accIds = new list<id>();
        for(account acc :accList){
            accIds.add(acc.Id);
            for(Integer i=1;i<=3;i++){
                case c = new case();
                c.Status = 'new';
                c.Origin = 'Phone';
                c.Product__c = 'GC3040';
                c.Type = 'Other';
                c.AccountId = acc.Id;
                csList.add(c);   
            }
            for(Integer i=1;i<=3;i++){
                case c = new case();
                c.Status = 'new';
                c.Origin = 'Email';
                c.Product__c = 'GC3043';
                c.Type = 'Electrical';
                c.AccountId = acc.Id;
                csList.add(c);   
            }
            for(Integer i=1;i<=3;i++){
                case c = new case();
                c.Status = 'new';
                c.Origin = 'Web';
                c.Product__c = 'GC3045';
                c.Type = 'Structural';
                c.AccountId = acc.Id;
                csList.add(c);   
            }
        }
        
        insert csList;
        test.startTest();
        calcualteCaseOrigin.countcaseBasedonorigin(accIds);
        test.stopTest();
        
        list<Account> accs = [select id,cases_through_email__c,
                              cases_through_phone__c,
                              cases_through_web__c 
                              from account where id In :accIds];
        //system.debug('accs'+accs);
        
        system.assertEquals(3, accs[0].cases_through_email__c);
        system.assertEquals(3, accs[0].cases_through_phone__c);
        system.assertEquals(3, accs[0].cases_through_web__c);
    }
}