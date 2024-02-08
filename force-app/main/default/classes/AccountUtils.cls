public class AccountUtils {
    public static List<Account> accountsByState(String mystr){
        List<Account> acclist = [SELECT Id,Name FROM Account WHERE billingState = :mystr];
        return acclist;        
    }
    
}