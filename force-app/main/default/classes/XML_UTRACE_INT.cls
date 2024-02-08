public class XML_UTRACE_INT {
    public string ipAddress{set;get;}
    public string body{set;get;}
    public string status{set;get;}
    public string data{set;get;}
    map<string,Object> res {set;get;}
    
    
    public void callUtrace(string ipAddress){
        string endPoint ='http://xml.utrace.de/?query='+ipAddress;	//step--1:create /identify End Point URL
        //create a proctocol 
        http p = new http();										//step--2:Initilize HTTP Protocal. 
        httpRequest request = new httpRequest();					//step--3:Create Request Structure
        request.setEndpoint(endpoint);								//step--4:on request structure set endPoint(Address)
        request.setMethod('GET');                                   //step--5:on request structure set method.
        
        HTTPResponse Responce = p.send(request);
        body = Responce.getBody();
        system.debug('Body'+body);
        
        DOM.Document doc = new DOM.Document();
        doc.load(body);
        
        Dom.XmlNode root = doc.getRootElement();
        list<DOM.xmlNode> result = root.getChildElements();
        DOM.XMLNode parent = result[0];
        list<DOM.XmlNode> data = parent.getChildElements();
        for(DOM.XmlNode ed :data){
            
            res.put(ed.getName(),ed.getText());
            
        }
    }
}