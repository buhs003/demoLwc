public class DemoSobjectsCollections {
    public void demomethod(){
        
        //set of account id
        set<id> accIds = new set<id>();
        //list containing 2 acc records
        list<account> accList = new list<Account>();
        accList = [select id,name from  account Limit 2];
        // map of id and account with all Accrecords and keys as Id
        map<Id,account> accMap = new map<Id,account>(accList);
        //itrating over list and adding accids in a set
        if(!accList.isEmpty()){
            for(Account acc :accList){
                accIds.add(acc.Id);
                // system.debug('Account Details----->'+accList);
            }
        }
        if(!accIds.isEmpty()){
            //itreating over set and searching key in map
            for(Id i :accMap.keyset()){
                if(accMap.containskey(i)){
                    system.debug('Map Value'+accMap.get(i));
                }
                // system.debug('AccIds Set----->'+i);
            }
        }
        
        
        //set of contactId
        set<id> conId = new set<id>();
        //list of contact 2 contact record
        list<Contact> conList = new list<Contact>();
        //fetch the 2 contact records
        conList = [select Id ,Name from contact limit 2];
        map<Id,contact> mapOfcon = new map<Id,contact>(conList);
        //itreating over the list and adding contact id to set
        if(!conList.isEmpty()){
            for(contact c :conList){
                conId.add(c.id); 
            }
        }
        //iterating over set and checking for the key id
        if(!conId.IsEmpty()){
            for(Id i :conId){
                if(mapOfcon.containsKey(i)){
                    system.debug('My Contact Map-->'+mapOfcon.get(i));
                }
            }   
        }
    }
}