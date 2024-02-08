public class Currency_Converter_INT implements database.Batchable<SObject>{
    
    public database.QueryLocator start (database.BatchableContext bc){
        
        string query ='select id,Amount ,INR_Value__c from opportunity';
        return database.getQueryLocator(query);
    }
    public void execute(database.BatchableContext bc,list<opportunity> scope){
        string url = 'http://api.currencylayer.com/live?access_key=b3c13e7fdaf2a01&source=USD&currencies=INR&format=1';
        http p = new http();
        httpRequest rq = new httpRequest();
        rq.setEndpoint(url);
        rq.setMethod('GET');
        
        httpResponse rs = p.send(rq);
        string result = rs.getBody();
        
        decimal amt;
        system.JSONParser jp = json.createParser(result);
        while(jp.nextToken() != null){
            //out put from doc after parsing
            if(jp.getText() =='USDINR'){
                jp.nextToken();
                amt = (decimal)jp.getDecimalValue();
            }
        }
        for(Opportunity op :scope){
            op.INR_Value__c  = 'Rs.' + (amt*op.Amount);
        }
        update scope;
    }
    public void finish(database.BatchableContext bc){
        
        
    }
    
}