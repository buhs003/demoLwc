public class JSON_M_Eg2_JSON_Parser {
    public string jsonString{set;get;}
    public string jsonStringnew{set;get;}
    public map<string,Object> result{set;get;}
    public string a;
    
    public void JSON_M_Eg2_JSON_Parser(){
        result = new map<string,object>();
        string Name;
        string Phone;
        string Rating;
        
        	//jsonString = '{"Status":"Sucess","Code":"200","Account":[{"Name":"Parser Tech","Phone":"7878787","Rating":"Hot"},{"Name":"Parser Tech 2","Phone":"232323","Rating":"Cold"},"Contact":{"FirstName":"Ravi","Phone":"55555"},{"FirstName":"Sham","Phone":"6666"},"FirstName":"Ram","Phone":"898989"]}';
        jsonString = '{"Name":"Malya","Phone":"123234","Rating":"Hot"}';
        	//if string is simple use simple method
       		 //simple de ser
        Account a = (Account)JSON.deserializeStrict(jsonString, Account.class);
        insert a;
        
        //if string is Complex use Complex  method
        //complex de ser
        system.JSONParser jp = JSON.createParser(jsonString);//----step-1---Create Parser.
        while(jp.nextToken()!=null){
            if(jp.getText() == 'Name'){
                jp.nextToken();
                Name = jp.getText();
            }
            if(jp.getText() == 'Phone'){
                jp.nextToken();
                Phone = jp.getText();
            }
            if(jp.getText() == 'Rating'){
                jp.nextToken();
                Rating = jp.getText();
            }
        }
        Account a1 = New Account();
        a1.Name = Name;
        a1.Phone = Phone;
        a1.Rating = Rating;
        Insert a1;
        
    }
    public   void nextMethod(){
        string name;
        jsonStringnew  = '[{"Name":"Baroda House","Description":"null","BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Delhi","District":"Central Delhi","Division":"New Delhi Central","Region":"Delhi","Block":"New Delhi","State":"Delhi","Country":"India","Pincode":"110001"},{"Name":"Bengali Market","Description":"null","BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Delhi","District":"Central Delhi","Division":"New Delhi Central","Region":"Delhi","Block":"New Delhi","State":"Delhi","Country":"India","Pincode":"110001"},{"Name":"Bhagat Singh Market","Description":"null","BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Delhi","District":"Central Delhi","Division":"New Delhi Central","Region":"Delhi","Block":"New Delhi","State":"Delhi","Country":"India","Pincode":"110001"}]';
        system.JSONParser jsnew = json.createParser(jsonStringnew);
        while(jsnew.nextToken() != null){
            if(jsnew.getText() == 'Name'){
                jsnew.nextToken();
                Name = jsnew.getText();
                system.debug('All Name--->'+Name);
                
            }
        }
        
    }
    public void nextMethod2(){
        a = '{"LastName":"mali","FirstName":"Shub","Customer":{"Name":"Wipro","Phone":"4444"},"Salary":250000}';
        system.JSONParser jp =  json.createParser(a);
        while(jp.nextToken() != null){
            if(jp.getText() == 'Customer'){
                jp.nextToken();
                account ac = (account)jp.readValueAs(Account.Class);
                system.debug('Account--->'+ac);
            }
            if(jp.getText() == 'Salary'){
                jp.nextToken();
                Decimal dc = (Decimal) jp.getDecimalValue();
                system.debug('Deciaml Value Of Salary--->'+dc);
            }
            if(jp.getText() == 'FirstName'){
                jp.nextToken();
                string nm = (string)jp.getText();
                system.debug('FirtName--->'+nm);
            }
            
        }
        
    }
    
}