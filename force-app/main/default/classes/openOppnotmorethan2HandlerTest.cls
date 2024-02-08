@istest
public class openOppnotmorethan2HandlerTest {
    @istest
    public static void beforeInsertHandTest(){
        Account acc = new Account(Name = 'Account');
        test.startTest();
        insert acc;
        
        list<opportunity> opplist = new list<opportunity>();
        opplist.add(new opportunity (Name='Closed won Opportunity',StageName='Prospecting',CloseDate= date.today(), Accountid = acc.Id));
        opplist.add(new opportunity (Name='Closed lost Opportunity',stageName='Prospecting',closeDate= date.today(), Accountid = acc.Id));
        insert opplist;
        
        Opportunity opp1 = (new opportunity(name='cannot Insert',StageName='Prospecting',closeDate=date.today(), Accountid = acc.Id));
        insert opp1;
        
        
        test.stopTest();
        
        
        
        
        list<opportunity> listopp = [select Id,Name,StageName from opportunity where account.name = 'Account'];
        
        for(Opportunity op :listopp){
            if(op.Name == 'cannot Insert'){
                System.assertEquals('Cannot Insert New Opp As it has allready 2 open opportunities',op.name );
                
            }
        }
    }
}