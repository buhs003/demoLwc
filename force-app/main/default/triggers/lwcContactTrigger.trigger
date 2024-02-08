trigger lwcContactTrigger on Contact (before delete) {
for (Contact c : trigger.old) {
    if (c.AccountId != null) {
        c.addError('Cannot Delete The Contact as its a Primary Contact');
    }
}
}