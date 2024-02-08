public class firstClass {
    //variable
    string grt = 'Hello World';
    //method
    public void printGreeting(){
        system.debug('Out Put String----->'+grt);
    }
    //Method
    public static void printMessage(String msg){
        system.debug('My Text-->'+msg);
    }
    //Method
    public String getDay(Integer dayNo){
        string dayString = '';
        switch on dayNo{
            when 0{
                dayString = 'Sunday';
            }
            when 1{
                dayString = 'Monday';
            }
            when 2{
                dayString = 'Tuesday';
            }
            when 3{
                dayString = 'Wed';
            }
            when 4{
                dayString = 'Thrus';
            }
            when 5{
                dayString = 'Fri';
            }
            when 6{
                dayString = 'Sat';
            }
            when else{
                dayString = 'Invaid No';
            }
        }
        return dayString;
    }
    //Method
    public string getDay(string dayAbbrivation){
        string dayString = '';
        switch on dayAbbrivation{
            when 'SUN' {
                dayString = 'Sunday';
            }
            when 'MON'{
                dayString = 'Monday';
            }
            when 'TUE'{
                dayString = 'Tuesday';
            }
            when 'WED'{
                dayString = 'Wed';
            }
            when 'THRU'{
                dayString = 'Thrus';
            }
            when 'FRI'{
                dayString = 'Fri';
            }
            when 'SAT'{
                dayString = 'Sat';
            }
            when else{
                dayString = 'Invaid dayAbbrivation';
            }
        }
        return dayString;
    }
    
}