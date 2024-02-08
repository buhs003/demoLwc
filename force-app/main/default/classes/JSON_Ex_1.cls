public class JSON_Ex_1 {
    //set of data
    //(set;get;) properties is used to expose 
    //data that is retrieved from some other source
    //representing a get accessor and a set accessor:
    public string integerValue{set;get;}
    public string decimalValue{set;get;}
    public string accountValue{set;get;}
    public string studentValue{set;get;}
    //taking same set of data one more 
    //time and changing data value to preety
    public string integerPretty{set;get;}
    public string decimalPretty{set;get;}
    public string accountPretty{set;get;}
    public string studentPretty{set;get;}
    //new properties are added
    public string contactNull{set;get;}
    public string contactValue{set;get;}
    
    
    //accessing class and values to properties
    public JSON_Ex_1(){
        //assigning values to the above properties
        integerValue = JSON.serialize(10);
        decimalValue = JSON.serialize(1000.123);
        //creating account to assign value to properties.
        account acc = new account();
        acc.Name = 'Wipro Company';
        acc.Phone = '7744820291';
        acc.Industry = 'Banking';
        //assigning values to the above properties
        accountValue = JSON.serialize(acc);
        
        //passing student values in constructor as defined 
        //and assigning it to student property.
        WrapperJSON_EX_1 std = new WrapperJSON_EX_1('Shubham Mali','Mangaon','7744820291');
        //assigning values to the above properties
        studentValue = JSON.serialize(std);
        
        //for new properties
        WrapperJSON_EX_1 std1 = new WrapperJSON_EX_1();
        std1.Stdcity = 'Amalner';
        std1.Stdname = 'Parag Mali';
        //non-preety method for Class data
        contactValue = JSON.serialize(std1);  
        //supress null when parameter is set true
        contactNull = JSON.serialize(std1,true);
        
        //preety method for Class data
        //display the class info Preety.
        integerPretty = JSON.serializePretty(34);
        decimalPretty = JSON.serializePretty(43.5);
        accountPretty = JSON.serializePretty(acc);
        studentPretty = JSON.serializePretty(std);
        }
}




//serilized non-pretty string in form of json
//outPut 
//Integer Number:10
//Decimal Number:1000.123
//Account Details:{"attributes":{"type":"Account"},"Name":"Wipro Company","Phone":"7744820291","Industry":"Banking"}
//Student Details :{"phone":"7744820291","name":"Shubham Mali","city":"Mangaon"} 

//serilized pretty string in form of json
//Integer Number:34
//Decimal Number:43.5
//Account Details:{ "attributes" : { "type" : "Account" }, "Name" : "Wipro Company", "Phone" : "7744820291", "Industry" : "Banking" }
//Student Details :{ "phone" : "7744820291", "name" : "Shubham Mali", "city" : "Mangaon" }


//Without Supress :{"phone":null,"name":"Parag Mali","city":"Amalner"}
//With Supress :{"name":"Parag Mali","city":"Amalner"}