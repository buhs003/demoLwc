@isTest
public class TestAccountTaskCreator {
    @isTest
    public static void afterInsertHandler(){
        list<account> acc = new list<account>();
        acc.add(new account(name='test account'));
        acc.add(new account(name='test account2'));
        insert acc;
    
        
        list<task> tasks = [select id,subject,WhatId,Account.Name from task];
        system.debug(tasks);
        
        for(task tk :tasks){
            if(tk.Account.Name == 'test account'){
                system.assertEquals('test account', tk.subject);
            }
            if(tk.Account.Name == 'test account2'){
                system.assertEquals('test account2', tk.subject);
            }
        }
    }
}