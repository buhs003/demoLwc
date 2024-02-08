@RestResource(urlMapping='/getAccount/*')
Global class REST_Service_Give_Data {
    @httpGet
    Global static string invoke(){
        //sombody gives me data that data i will read.
        RestRequest request = restContext.request;//to retrive/Read Data from endpoint.
        Map<String,String> urlMap = request.params;//Passing values to map variable.
        system.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        //field value is case sensetive.
        string rcity = urlMap.get('City');
        list<Account> al = [select name,phone,Industry from account where billingCity= :rcity  AND phone != null AND Industry != null];
        
        for(Account a :al){
            js.writeStringField('Status', 'Sucess');
            js.writeStringField('Name', a.Name);
            js.writeStringField('Reg Phone', a.Phone);
            js.writeStringField('Bussiness Type', a.Industry);
        }
        js.writeEndObject();
        string result = js.getAsString();
        return result;
    }
}