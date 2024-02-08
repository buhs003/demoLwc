public class JSON_M_Eg1_JSON_SER {
    public void createJson(string name,string phone,string industry){
        //jsonGeneratorclass creating new structural format jsongenerator class.  
        system.JSONGenerator js = json.createGenerator(true); 	//step 1 -create JSON Genarator.
        js.writeStartObject();                            		//step 2 -start writing JSON.
        try{
            Account a = new Account();
            a.Name = name;
            a.Phone = phone;
            a.Industry = industry;
            insert a;
            
            js.writeStringField('Status', 'Sucess');			//step3-write to JSON as per requirement
            js.writeIdField('AccId', a.Id);
            js.writeStringField('Message', 'Account Created Sucessfully');
            js.writeNumberField('Code', 100);
            
        }catch(DMLException e){
            js.writeStringField('Status', 'Failed');
            js.writeStringField('Message', e.getMessage());
            js.writeNumberField('Code', 200);
            
        }
        js.writeEndObject();                         			//step   -End writing to JSON.
        string Result = js.getAsString();                       //step   -Get the final output.
        system.debug(Result);                                   //step 	 -set/Check the outup.
    }
    //method.
    public void BringAccount(){
        system.JSONGenerator js1 = JSON.createGenerator(true);
        js1.writeStartObject();
        try{
            list<Account> ac = [select Name, phone from Account];
            for(Account a :ac){
                js1.writeStringField('Account Name', a.Name);
                if(a.Phone != null){
                    js1.writeStringField('Phone', a.Phone);
                }
                js1.writeStringField('Status', 'Sucess');
                js1.writeNumberField('Code', 800);
            }
        }catch(Exception e){
            js1.writeStringField('Status', 'Failed');
            js1.writeStringField('Message', e.getMessage());
            js1.writeNumberField('Code', 600);
            
        }
        js1.writeEndObject();
        string op = js1.getAsString();
        system.debug(op);
    }
}