@isTest
public class TestPreventDelAccount {
@isTest
    public static void PreventDelAccount(){
        list<account> accs = new list<account>();
        accs.add(new account(name='test account 1'));
        insert accs;
        list<opportunity> opps = new list<opportunity>();
        opps.add(new opportunity(name='opporunity for account 1',stageName='Closed Won',closeDate=date.today(),AccountId =accs[0].Id));
        insert opps;
        
        list<account> accsaffected = [select id,name,(select id,name,stageName from opportunities) FROM Account];
        for(account ac :accsaffected){
            if(ac.Name == 'test account 1'){
                
            }
        }
    }
}