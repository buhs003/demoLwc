trigger YoutubeS6 on Account (before delete) {
    switch on trigger.OperationType{
        when before_delete{
            for(Account acc :trigger.Old)
                if(acc.Active__c == 'Yes')
                acc.Active__c.Adderror('Cannot Delete Active Account');
        }
    }
    
}