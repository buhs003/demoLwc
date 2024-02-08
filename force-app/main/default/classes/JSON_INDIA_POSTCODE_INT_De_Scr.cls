public class JSON_INDIA_POSTCODE_INT_De_Scr {
    public string pinCode;
    
    
    public void getPostalDetails(string pin){
        list<string> plac = new list<string>();
        
        string endPoint = 'https://api.postalpincode.in/pincode/'+pin;
        HTTP p = new HTTP();
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        
        HTTPResponse response = p.send(request);
        
        string body = response.getBody();
        system.JSONParser jp = json.createParser(body);
        while(jp.nextToken()!=null){
            if(jp.getText() == 'Name'){
                jp.nextToken();
                plac.add(jp.getText());
                system.debug('Location-->'+plac);
                
            }
            
        }
    }
}