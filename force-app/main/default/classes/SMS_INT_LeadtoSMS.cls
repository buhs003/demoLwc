global class SMS_INT_LeadtoSMS {
    @future(callOut=true)
    global static void sendMessage(set<id> leadids){
        list<Lead> leads = [select id,Mobile_No__c,firstName from lead where id in :leadids];
        system.debug(leads);
        for(lead el :leads){
            http p = new http();
            httpRequest request = new httpRequest();
            string endPoint = 'https://api.textlocal.in/send/?';
            endPoint = endPoint + 'Api Key= MzQzOTU3NTI0YjVhNWE0NDY3Njg1MDQ2NDY0NDU0NmY';
            endPoint = endPoint + '&numbers='+'91'+el.Mobile_No__c;
            endPoint = endPoint +'&sender=TXTLCL';
            endPoint = endPoint +'&message=Welcome_To_Bon_Vivant_From_Shubham';
            
            //https://api.textlocal.in/send/?NGM1ODM5NDU1NTc0Njc0NDZiNDM2NzUzMzEzNTZiNjM&numbers+917744820291&sender=TXTLCL&message=welcome_to_bon_vivant_from_shubham
            
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            
            httpResponse response = p.send(request);
            system.debug(response);
        }
    }
}