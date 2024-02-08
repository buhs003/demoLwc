/**
*AccountControllerClass
*This Class has Helpfull methods to work with account obj
**/
//Insert a list of account 

public with sharing class accountController{
    public static List<Account> insertAccount(List<Account> accountToinsert){
        insert accountToinsert;
        return accountToinsert;
    }
    public static Account insertSingleaccount(Account acc){
        insert acc;
        return acc;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAllaccount(){
        List<Account> acc1 =[SELECT Id,Name,Type,phone,Industry,Rating from Account limit 10];
        return acc1;
    }
    public static void printAllaccount(){
        List<Account> acc2  = getAllaccount();
        for(Account accc : acc2){
            system.debug('Account Name'+accc.Name+',Account Id'+accc.Id+'Account Rating'+accc.Rating);
        }
    }
    public static Integer accountSize(){
        List<Account> acc3 =[SELECT Name,Id,Rating FROM Account];
        return acc3.size();
    }
}