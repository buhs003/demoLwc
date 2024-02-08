trigger YoutubeS8 on Account (after undelete) {
    switch on trigger.OperationType{
        when after_undelete{
            for(Account acc : trigger.new){
                sendemail.sendMail('mali.shub186@gmail.com','Account Is Resorted','The Account Had Been Resorted Sucessfully');
            }
        }
    }
    
}