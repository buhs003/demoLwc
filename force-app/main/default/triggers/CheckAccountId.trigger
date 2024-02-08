trigger CheckAccountId on Contact (before delete) {
    for(Contact c :trigger.new){
        if(c.AccountId == null){
            c.AccountId.addError('Cannot Del');
        }
    }
}