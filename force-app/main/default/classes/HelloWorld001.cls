//helloworld001 class
//this is a demo to demonstrate how an apexclass is defined and excecuted


public class HelloWorld001 {
    string greeting = 'Hello World';
    public string name = 'Shubham';
    
    public void printgreeting(){
        system.debug(greeting);
    }
    public void myspelling(){
        system.debug(name);
    }	
    public void myparametrized(string msg){
        system.debug(msg);
    }
    public string getday(Integer daynumber){
        string daystring = '';
        switch on daynumber{
            when 0{
                daystring = 'sun';
            }
            when 1{
                daystring = 'mon';
            }
            when else{
                daystring='Invaid No';
            }
        }
        return daystring;
    }
    
    public string getDayabbrivation(string abbrivation){
        string daystring= '';
        
        switch on abbrivation{
            when 'sun'{
                daystring = 'sunday';
            }
            when else {
                    daystring = 'in vaild day string';
                }
        }
        return daystring;
    }
}