trigger Youtubess4 on Account (before update) {
    switch on trigger.operationType{
        when before_update{
            for(Account acc :trigger.new){
                if(acc.Name != trigger.oldMap.get(acc.Id).Name)
                acc.Name.addError('Not Allowed to change AccName');
            }
        }
    }
}