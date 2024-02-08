trigger SGupdateClientContactFieldOnAcc on Account (after insert) {
    switch on trigger.operationType{
        when after_insert{
            SGSGupdateClientContactFieldOnAcc.afterInsertHandler(trigger.new);
        }
    }
}

//map<09876544, amaial name client> 

//map<Id, Account> ldtMsp = new <Id, Account>();
//account a = ldtmsp.get(id);
//string email = ldtmsp.get(id).Email;