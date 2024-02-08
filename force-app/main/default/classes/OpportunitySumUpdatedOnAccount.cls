public class OpportunitySumUpdatedOnAccount {
    @invocableMethod
    public static List<Decimal> updateAccRevenue(List<Id> ids){
        
        List<Opportunity> oppList = [SELECT AccountId, Amount FROM Opportunity WHERE Id =: ids[0]];
        
        List<Account> accList = [SELECT AnnualRevenue FROM Account WHERE Id = :oppList[0].AccountId];
        
        list<Decimal> annualRevenueList = New List<Decimal>();
        accList[0].AnnualRevenue = accList[0].AnnualRevenue + oppList[0].Amount;
        update accList;
        annualRevenueList.add(accList[0].AnnualRevenue);
        return annualRevenueList;
    }
    
}