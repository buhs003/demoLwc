public class AccountCreationFlow {
    @invocableMethod
    public static List<String> updateAccountName(List<Id> ids){
        list<String> accountNames = new list<string>();
        list<Account> accounts = [SELECT Name FROM Account WHERE ID In :ids];
        for(Account acc : accounts){
            accountNames.add(acc.Name);
        }
        return accountNames;
    }
}