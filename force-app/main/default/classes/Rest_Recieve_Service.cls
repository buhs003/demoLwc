@restResource(urlMapping='/createAccount/*')
Global class Rest_Recieve_Service {
    @HttpPost
    //third party system has requested me a data where i will give Data in the form of json and the requested values are in the body if post method is used.
   	 global static string callme(string name, string phone ,string Industry){
        //complex Serilization.
        system.JSONGenerator js = json.createGenerator(true);
        js.writeStartObject();
        try{
            Account acc = new Account();
            acc.Name = name;
            acc.Phone = phone;
            acc.Industry = Industry;
            insert acc;
            js.writeStringField('Status', 'Sucess');
            js.writeStringField('AccountId', acc.Id);
            
        }catch(exception e){
            js.writeStringField('Status', 'Failed');
            js.writeStringField('AccountId', e.getMessage());
            
        }
        js.writeEndObject();
        string result=js.getAsString();
        return result;
        //respond is given back 
        //to see our given respond we need work bench
    }
    //Get is complex to write easy to use.
    //Data is in the link itself  of which the value can be passed.
    
    //Post is easy to write complex to use.
    //Data is in the body of the value can be passed.
    
    @HttpGet
	//third party system has requested me a data where i will give Data in the form of json and the requested values are in the link if get method is used.

    global static string invoke(){
        //to read a link.
        RestRequest req = RestContext.request;//to retrive/read data from endPoint Url.
        Map<String ,String> urlMap = req.params;//passing values to map variable.
        
        system.JSONGenerator js = json.createGenerator(true);
        js.writeStartObject();
        try{
            Account acc = new Account();
            acc.Name = urlMap.get('Name');
            acc.Phone = urlMap.get('Phone');
            acc.Industry = urlMap.get('Industry');
            insert acc;
            
            js.writeStringField('Status', 'Sucess');
            js.writeStringField('AccountId', acc.Id);
            
        }catch(exception e){
            
            js.writeStringField('Status', 'Failed');
            js.writeStringField('AccountId', e.getMessage());
            
        }
       js.writeEndObject();
        string result = js.getAsString();
        return result;
        
    }
}