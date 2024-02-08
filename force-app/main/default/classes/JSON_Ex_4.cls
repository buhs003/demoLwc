public class JSON_Ex_4 {
    public string name				{set;get;}
    public string phone				{set;get;}
    public decimal annualRevenue	{set;get;}
    public string result			{set;get;}
    //constructor to create following
    public void create(){
        //allows to write the json string as we defined'
        //preety value is set as true.
        system.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        account acc = new account();
        
        try{
            acc.Name = name;
            acc.Phone = phone;
            acc.AnnualRevenue = annualRevenue;
            insert acc;
            //if the acc has a validation for revenue amount then i should get the sucess and fail report by following.
            //generate fields and its value to integrate.
            js.writeStringField('Status', 'Sucess');
            js.writeIdField('Id', acc.Id);
        }catch(DMLException e){
            js.writeStringField('Status', 'Failed');
            js.writeStringField('Error', e.getMessage());
        }
        //end and take string as a result
        js.writeEndObject();
        //lets catch the string value.
        result = js.getAsString();
    }
}