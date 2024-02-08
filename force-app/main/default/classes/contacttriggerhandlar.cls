public class contacttriggerhandlar {
    public static void duprec(list<contact> conList,map<id,contact> oldconMap){
        set<string> emailset = new set<string>();
        for(contact con :conList){
            if(oldconmap == null&&con.email!= null){
                emailset.add(con.Email);
            }else{
                if(con.Email!=null &&con.email!=oldconMap.get(con.id).email){
                    emailset.add(con.Email);
                }
            }
        }
        list<contact> existingContactList = new List<Contact>([select id,Email from 
                                                               contact where email
                                                               IN :emailset]);
        set<string> emaillistforexisting = new set<string>();
        if(!existingContactList.isEmpty()){
            for(contact con :existingContactList){
                emaillistforexisting.add(con.email);
            }
        }
        for(contact con :conList){
            if(emaillistforexisting.contains(con.email)){
                con.addError('Duplicate Email Present');
            }
        }
    }
}