trigger YoutubeS7 on Account (after delete) {
    switch on trigger.OperationType{
        when after_delete{
            for(Account acc :Trigger.old){
                sendemail.sendMail('mali.shub186@gmail.com','Account Deletion','The Account Had Been deleted need action');
            }   
        }
    }
}