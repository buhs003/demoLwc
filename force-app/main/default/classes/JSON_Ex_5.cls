public class JSON_Ex_5 {
    //If i need to de-serilize the specific fields 
    //from the jsonEntire dataResponce then i will use dynamic de-serilizetion.
    //i will breck the data and will take what we need from it we get it in the form of tokens.
    //deserilizing the data dynamically i will use JsonTokens
    public map<string,object> resMap {set;get;}
    public string JSONString          {set;get;}
    
    public JSON_Ex_5(){
        system.JSONGenerator jp = JSON.createGenerator(true);
        jp.writeStartObject();
        jp.writeStringField('Name', 'Shubham');
        jp.writeNumberField('Age', 33);
        jp.writeDateField('DOJ', system.today());
        jp.writeFieldName('Marks');
        jp.writeStartArray();
        jp.writeNumber(10);
        jp.writeNumber(20);
        jp.writeNumber(30);
        jp.writeEndObject();
        JSONString = jp.getAsString();
    }
    public void getData(){
        resMap = new Map<String,object>();
        system.JSONParser js = JSON.createParser(JSONString);
        while(js.nextToken() != null){
            resMap.put(js.getText(),js.getCurrentToken());
        }
    }
}