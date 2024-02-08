trigger Youtubess3 on Account (after insert) {
    switch on trigger.operationtype{
        when after_insert{
            List<Contact> contoupdate = New List<Contact>();
            for(Account acc : trigger.new){
                Contact con = new Contact();
                con.LastName = acc.Name;
                con.AccountId = acc.Id;
                contoupdate.add(con);
            }
            if(contoupdate.Size()>0)
                insert contoupdate;
        }
    }
    
}