trigger ContactPhEmlError on Contact (before insert) {
    if(Trigger.isbefore && Trigger.isinsert){
        HandlerContactPhEmlError.noDuplicate(Trigger.new);
    }
}