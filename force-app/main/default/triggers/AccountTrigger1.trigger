trigger AccountTrigger1 on Account (after insert) {
    Switch on trigger.OperationType {
        when AFTER_INSERT{
            list<Contact> conList = new list<Contact>();
            for(Account ac :trigger.new){
                for(Integer i=0;i<=2;i++){
                    contact c = new Contact();
                    c.AccountId = ac.Id;
                    c.LastName = ac.Name;
                    conList.add(c);
                }
            }
           insert conList;
        }
        
    }
}