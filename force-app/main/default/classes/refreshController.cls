public with sharing class refreshController {
    @AuraEnabled
    public static List<Account> getAccountRating(Id accountId) {
        return [select Id, Name, Rating from Account where Id =:accountId];
    }
    return null;
}