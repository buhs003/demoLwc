public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String searchterm){
        List<List<sObject>> searchlist = [FIND :searchterm IN ALL FIELDS RETURNING Account(Name),
            Contact(FirstName,LastName,Department),
                                          Lead(FirstName,LastName,Email)];
        system.debug(searchlist);
        return searchlist;
    }
}