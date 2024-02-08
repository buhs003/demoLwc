trigger leadTrigger on Lead (before insert) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
            for(lead l :trigger.new){
                if(l.LeadSource == 'Web'){
                    l.Rating = 'Cold';
                }
                else{
                    l.rating = 'Hot';
                }
            }
            
        }
    }

}