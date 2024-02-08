@isTest
public class TestAccountChangesContactBilCity {
    @isTest
    public static void afterupdateHandTest(){
        list<account> accs = new list<account>();
        accs.add(new account(name='test account 1',billingCity = 'test city'));
        accs.add(new account(name='test account 2',billingCity = 'test 2 city'));
        insert accs;
        
        account acc = [select id,name,billingCity from account where name ='test account 1'];
        acc.BillingCity = 'test 3 city';
        update acc;
        
        
        list<contact> cons = [select id,name,MailingCity,AccountId,Account.Name,Account.BillingCity FROM contact];
        for(contact constst :cons){
            if(constst.Account.Name == 'test account 1'){
                system.assertEquals('test city', constst.MailingCity);
            }
            if(constst.Account.Name == 'test account 2'){
                system.assertEquals('test 2 city', constst.MailingCity);
            }
            if(constst.Account.Name == 'test account 1'){
                system.assertEquals('test 3 city', constst.MailingCity);
                
            }
        }
        system.assertEquals(2, accs.size());
    }
}