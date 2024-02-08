trigger leadAutoConvert on Lead (after insert) {
    switch on trigger.operationType{
        when after_insert{
            set<Id> allIds = new set<id>();
            LeadStatus convStatus = [Select MasterLabel from LeadStatus 
                                     where IsConverted = true limit 1];
            
            List<Database.LeadConvert> leadConv = new List<Database.LeadConvert>();
            
            for(lead leads :trigger.new){
                if(!leads.IsConverted && leads.LeadSource == 'Phone Inquiry'){
                    allIds.add(leads.Id);
                    
                    Database.LeadConvert lc = new Database.LeadConvert();
                    
                    lc.setLeadId(leads.Id);
                    lc.setOpportunityName(leads.Name);
                    lc.setConvertedStatus(convStatus.MasterLabel);
                    
                    leadConv.add(lc);
                }
            }
            if(leadConv != null && leadConv.size()>0){
                List<Database.LeadConvertResult> lcr = Database.convertLead(leadConv);
            }
            
        }
    }
}