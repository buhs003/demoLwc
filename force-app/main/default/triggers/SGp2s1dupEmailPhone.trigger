trigger SGp2s1dupEmailPhone on Contact (before insert,before update) {
    switch on trigger.operationType{
        when before_insert{
            //new value in map inserted.
            map<string,contact> emailMap = new  map<string,contact>();
            map<string,contact> phoneMap = new  map<string,contact>();
            for(Contact con :trigger.new){
                emailMap.put(con.Email,con);
                phoneMap.put(con.phone,con);
            }
            string errorMessage  = '';
            //getting the contacts whose email or phone already exists
            list<contact> existingContacts = [select id,email,phone from contact where email In:emailMap.Keyset() OR Phone In:phoneMap.keySet()];
            if(existingContacts.size() > 0 ){
                for(contact conList :existingContacts){
                    if(conList.Email != null){
                        if(emailMap.get(conList.Email) != null){
                            errorMessage='Email';
                        }
                    }
                    if(conList.phone != null){
                        if(phoneMap.get(conList.Phone) != null){
                            errorMessage = errorMessage + (errorMessage != '' ? 'and Phone ' : 'Phone ');                        }
                    }
                }
                if(errorMessage != ''){
                    trigger.new[0].addError('Your Contact '+errorMessage+'allready exists in system.');
                }
            }
        }
        when before_update{
            //new value in map updated.
            map<string,contact> emailMap = new  map<string,contact>();
            map<string,contact> phoneMap = new  map<string,contact>();
            for(contact con :trigger.new){
                if(trigger.oldMap.get(con.Id).Email != con.Email){
                    emailMap.put(con.Email,con);
                }
                if(trigger.oldMap.get(con.Id).Phone != con.Phone){
                    phoneMap.put(con.Phone,con);
                }
            }
            string errorMessage  = '';
            //getting the contacts whose email or phone already exists
            list<contact> existingContacts = [select id,email,phone from contact where email In:emailMap.Keyset() OR Phone In:phoneMap.keySet()];
            if(existingContacts.size() > 0 ){
                for(contact conList :existingContacts){
                    if(conList.Email != null){
                        if(emailMap.get(conList.Email) != null){
                            errorMessage='Email';
                        }
                    }
                    if(conList.phone != null){
                        if(phoneMap.get(conList.Phone) != null){
                            errorMessage = errorMessage + (errorMessage != '' ? 'and Phone ' : 'Phone ');                        }
                    }
                }
                if(errorMessage != ''){
                    trigger.new[0].addError('Your Contact '+errorMessage+'allready exists in system.');
                }
            }
        }
    }
    
}