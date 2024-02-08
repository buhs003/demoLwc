public class AccountTaskCreatorHandler {
    public static void afterInsertHandler(List<Account> newRecords){
            List<Task> taskList = New List<Task>();
            for(Account a :newRecords){
                Task newTask = New Task();
                newTask.WhatId = a.Id;
                newTask.Subject = a.Name;
                taskList.add(newTask);
            }
            if(taskList != null && taskList.size()>0)
                insert taskList;
        }
    }