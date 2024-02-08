@istest
public class AccountCalulatorTest {
    @istest
    public static void countContactstest(){
        //generate a data
        //dml/insert data
        //query data
        //assert data
        list<account> acclist = new list<account>();
        for(integer i=0;i<5;i++){
            Account a = new Account();
            a.Name = 'Test Account'+i;
            acclist.add(a);
        }
     
        insert acclist;
        
        
        list<contact> conList = new list<contact>();
        list<Id> accIds = new list<Id>();
        for(account acc :acclist){
            conList.add(new Contact (firstName='Test ',LastName = acc.name, AccountId = acc.id));
                accIds.add(acc.id);
        } 
        
       insert conList; 
        
        system.debug(conList);
       
         
        
        test.startTest();
        AccountCalculator.countContacts(accIds);
        test.stopTest();
        
        list<Account> accs = [select id, ActiveContacts__c from Account];
        system.debug(accs);
        system.assertEquals(1, accs[0].ActiveContacts__c);  
    }
}