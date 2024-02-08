public class HandlerContactPhEmlError {
    public static void noDuplicate(list<Contact> lstNewCon){
        map<string, Contact> mapOfEmail = new map<string, Contact>();
        map<string, Contact> mapOfPhone = new map<string, Contact>();
        
        list<Contact> conDetail = [select Id, Email, Phone From Contact Where Phone != null AND Email != Null];
        
        for(Contact c : conDetail){
            mapOfEmail.put(c.Email, c);
            mapOfPhone.put(c.Phone, c);
        }
        system.debug(mapOfPhone);
        for(Contact co : lstNewcon){
            Contact conEmail = mapOfEmail.get(co.email);
            Contact conPhone = mapOfPhone.get(co.phone);
            system.debug(conPhone);
            
            
            if(conEmail != null && conPhone != Null){
                co.addError('Phone Or Email Cant Not Be Duplicate');
            }
        }
    }
}








//map<Id, string> idstringmap = new map<Id, string>();
//(key, value)
//(100, 'aniket)
//(200, 'shubham)
//(300, 'prashant)
//"100":"aniket"
//
// string name;
// name = idstringmap.get(100);
// idstringmap.containskey(100);
// system.debug(name);
//acc con
//(100, (id, email, phone, lastname))
//string email;
//Contact condetil;
//condetail = conmap.get(100);
// email= conmap.get(100).Email