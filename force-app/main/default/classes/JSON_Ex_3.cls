public class JSON_Ex_3 {
    public string jsonString {set;get;}
    public JSON_Ex_3(){
        //allows to write the json string as we defined'
        //preety value is set as true.
        system.JSONGenerator gen = JSON.createGenerator(true);
        //start to write objects field ands its value.
        gen.writeStartObject();
        
        gen.writeFieldName('EmpName');
        gen.writeString('Shubham');
        gen.writeFieldName('Age');
        gen.writeNumber(20);
        //allows to write field and its value 
        gen.writeStringField('Branch','SRNagar');
        gen.writeNumberField('Roll No', 02);
        gen.writeDateField('DOB', date.today());
        //we can also pass the blob value
        string myVal = 'abcdxys';
        Blob body = blob.valueOf(myVal);
        //passing the blob field and its body.
        gen.writeBlobField('Pass', body);
        //lets end writing our object fields and values
        gen.writeEndObject();
        //lets get the final value as a string from the generator method.
        JSONString = gen.getAsString();
    }
}