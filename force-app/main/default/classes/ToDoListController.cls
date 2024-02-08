/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-08-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ToDoListController {
    
    @AuraEnabled
    public static Boolean deleteTask(Id recordId){
        try {
            Database.delete(recordId);
            return true;
        } catch (Exception e) {
            system.debug(e.getMessage());
        }
        return false;
    }
    
    @AuraEnabled
    public static Task insertTask(string subject){
        try{
            task task = new task(
                Subject = subject,
                OwnerId = userInfo.getUserId(),
                Status = 'Not Started',
                Priority = 'Normal'
            );
            insert task;
            return task;
        }catch(Exception e){
            system.debug(e.getMessage());
            return null;
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Task> getTasks(){
        return [SELECT subject from Task where OwnerId = :userinfo.getUserId() LIMIT 5];
    }
}