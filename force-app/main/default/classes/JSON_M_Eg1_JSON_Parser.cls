public class JSON_M_Eg1_JSON_Parser {
    //constructor is a specialized method used for initialization.
    //It assigns variable to a class variable.
    public string jsonString		{set;get;}
    public map<string,object> result{set;get;}
    
    public JSON_M_Eg1_JSON_Parser(){
        result = new map<string,object>();
        jsonString = '{"Name":"Shubham","Marks":[10,20,30],"City":"Hyd"}';//JSONString.
        system.JSONParser jp = JSON.createParser(jsonString);			//Creating a Instance JSONParser.
        
        while(jp.nextToken()!=null){									//Using a while block. 
            result.put(jp.getText(), jp.getCurrentToken());				//if the parserMethod .nextToken != null,i will Populate my Map(.getText,.getCurrentToken).
            system.debug('My Dynamically Deserilized String'+result);	//Print the result from while loop.
        }
    }
}