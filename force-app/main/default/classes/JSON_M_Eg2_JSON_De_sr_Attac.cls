public class JSON_M_Eg2_JSON_De_sr_Attac {
    public void jsonAttchment_deser(){
        //step 1-pull/Retrive the attachment
        document d = [select id,name,body from document where name='Test'];
        ///////serilize the Attchment//////
        string jsd1 = json.serialize(d);//simple serilization.
        system.debug('Simple Serilization-->'+jsd1);
        
        system.JSONGenerator js = json.createGenerator(true);//complex/dynamic serilization
        js.writeStartObject();
        js.writeBlobField('Attchment', d.Body);
        js.writeEndObject();
        string jsd2 = js.getAsString();
        system.debug('Complex Serilization-->'+jsd2);
        
        
        ///////deserlize the attachment/////
        blob jdd1 = (blob)json.deserialize(jsd1, blob.class);////stnd/simple deserlization.
        system.debug(jdd1);
        
        
        system.JSONParser jp = json.createParser(jsd2);///complex/dynamic deserlization.
        while(jp.nextToken()!= null){
            if(jp.getText() == 'Attchment'){
                jp.nextToken();
                blob jdd2 = (blob)jp.getBlobValue();
                system.debug(jdd2);
                
                //write a program to save the deserilized blob image to salesforce system.
            }
            
        }
    }
    
}