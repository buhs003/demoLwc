public class MyPerControl {
    //Insert Persons
    public static List<Person__c> insertPersons(List<person__c> personstoInsert){
        insert personstoInsert;
        return personstoInsert;
    }
    //Insert Person
    public static Person__c insertPerson(Person__c personToInsert){
        insert personToInsert;
        return personToInsert;
    }
    //Get Inserted Persons
    public static List<Person__c> getallPersons(){
        List<Person__c> persons = [SELECT Name, Mobile__c FROM Person__c];
        return persons;
        
    }
    //print all Persons
    public static void printAllPersons(){
        List<Person__c> persons = getallPersons();
        for(Person__c printPer :persons){
            system.debug('Name Of Person-->'+printPer.Name+',Mobile No Of Person--->'+printPer.Mobile__c);
        }
    }
    //Get Size of persons
    public static Integer getPersonsSize(){
        List<Person__c> persons = getallPersons();
        return persons.size();
    }
}