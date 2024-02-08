import { LightningElement, wire } from 'lwc';
//need to refer message channel
import SampleMessageChannel from '@salesforce/messageChannel/SampleMessageChannel__c';
//we have diffrent apis so lets import it.
import { MessageContext, publish } from 'lightning/messageService';
export default class LmsComponentA extends LightningElement {
    inputValue
    //using wire on messageContext 
    //wich gives info of all the 
    //components which use messageContext service/lightning message service. 
    //and return 
    //them in 
    //one context property/object
    @wire(MessageContext)
    context

    inputHandler(event){
       this.inputValue = event.target.value 
    }
    //publish a message
    publishMessage(){
        
        const message={
            // this is the field used from lms meta file where it is going to pass the data or recive the data
            //passing the data in the object form which is passed via value field.
            lmsData:{
                value:this.inputValue
            }
        }
        //publish(messageContext,messageChannel,message)
        publish(this.context,SampleMessageChannel,message)
        
    }
}