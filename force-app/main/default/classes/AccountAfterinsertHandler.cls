@isTest
public class AccountAfterinsertHandler {
    @isTest
    static void testinsert(){
        integer count = [select count() from Account];
        integer size = [select count() from Contact];
        Account acc = new Account(Name='Learn',phone='022-845454',Industry='Banking');
        try{
            insert acc;
        }catch(exception e){
            system.debug(e);
        }
        Integer accCount = [select count() from Account];
        Integer conCount =[select count() from Contact];
        Contact c = [select lastName,phone from contact where accountId =:acc.Id];
        System.assertEquals(c.lastName,acc.name);
        System.assertEquals(c.phone,acc.phone);
        
        
    }
    
}