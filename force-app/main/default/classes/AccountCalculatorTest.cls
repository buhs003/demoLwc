@isTest
public class AccountCalculatorTest {
    @isTest
    public static void countContactsTest(){
        //created 250 accounts are added in list 
        list<Account> accList = new list<Account>();
        
        for(Integer i=0;i<250;i++){
            accList.add(new Account(name='Test Account  '+i));
        }
        insert accList;
        //created new contact is associated with the inserted 250 accounts added to conlist.
        list<Contact> conList = new list<contact>();
        list<Id> accIds = new list<Id>();
        for(Account acc :accList){
            conList.add(New Contact(FirstName='Test Contact',LastName=acc.Name,AccountId = acc.Id));
            accIds.add(acc.Id);
            system.debug(conList);
        }
        insert conList;
        
        test.startTest();
        //future method accepts the Ids of account with assicoted contact.
        AccountCalculator.countContacts(accIds);
        test.stopTest();
        
        list<Account> accs = [Select Id,CountOfContact__c From Account];
        system.assertEquals(1, accs[0].CountOfContact__c);
        system.assertEquals(1, accs[1].CountOfContact__c);
        
    }
}