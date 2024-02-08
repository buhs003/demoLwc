trigger PTStudent on Student__c (before insert,before update) {
    switch on trigger.operationType{
        when before_insert{
            for(Student__c stu : trigger.new){
                if((string.valueof(stu.Course_Opted__c) != null) 
                   						&& (stu.Initial_Fees__c <5000))
                    stu.Initial_Fees__c.addError('Course fee is greater than $5000');
                    
                    
            }
        }
    }

}