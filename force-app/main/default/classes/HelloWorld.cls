Public class HelloWorld {
    public string getDay(Integer dayNumber){
        string dayString =' ';
        switch on dayNumber{
            when 0{
                dayString = 'Sunday';
            }when else{
                dayString ='Invaid';
            }
        }
        
        return dayString;
    }
    
}