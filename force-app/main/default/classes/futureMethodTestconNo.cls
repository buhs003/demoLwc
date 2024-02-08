@isTest
public class futureMethodTestconNo {
    @isTest
    public static void accountCalcualtorTest(){
        list<account> accList = new list<Account>();
        for(integer i=0;i<250;i++){
            account acc = new account();
            acc.Name = 'Test account'+i;
            accList.add(acc);
        }
        insert accList;
        
        list<contact> conList = new list<contact>();
        list<Id> accIds = new list<Id>();
        for(account acc  :accList){
            contact con  = new contact();
            conList.add(new contact(firstName = 'Test Account',
                                    lastName = acc.Name,
                                    accountId = acc.Id));
            accIds.add(acc.id);
        }
        insert conList;
        test.startTest();
        futureMethodcalculateTotalNoofcontacts.calcualtetotalnoofcontacts(accIds);
        test.stopTest();
        
        list<Account> accs =[select id,CountOfContact__c from account];
        system.assertEquals(1, accs[0].CountOfContact__c,'contacts are not counted');
        
    }
}