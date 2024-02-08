trigger DupicateCheckOpp on Opportunity (before insert) {
    switch on trigger.operationType{
        when before_insert{
            set<id> Accidset = new set<id>();
            for(opportunity opp :trigger.new){
                Accidset.add(opp.AccountId);
            }
            list<Account> AccList = [SELECT Id,Name,(select Name FROM Opportunities) 
                                     FROM Account WHERE Id IN :Accidset];      
            
            map<Id,list<String>> AccOppMap = new Map<Id,List<String>>();
            for(Account Acc :AccList){
                List<String> opptName = new List<String>();
                
                for(Opportunity op1 : Acc.Opportunities){
                    opptName.add(op1.Name);
                }
                AccOppMap.put(Acc.Id,opptName);
            }
            for(Opportunity tr :trigger.New){
                if(AccOppMap.get(tr.AccountId).contains(tr.Name)){
                    tr.Name = 'Duplicate Record:--> ' + tr.Name;
                }
            }
        }
    }
}