import { LightningElement, wire } from 'lwc';
import SampleMessageChannel from '@salesforce/messageChannel/SampleMessageChannel__c';
import { subscribe, MessageContext, APPLICATION_SCOPE, unsubscribe } from 'lightning/messageService';
export default class LmsComponentX extends LightningElement {

    recivedMessage
    subscription
    @wire(MessageContext)
    context
    //need to call thsi life scycle hook which gets call on the page lode.
    connectedCallback() {
        this.subscribeMessage()
    }
    subscribeMessage() {
        //subscribe(messageContext,messageChannel,listner,subscribeOptions)
        this.subscription = subscribe(this.context, SampleMessageChannel, (message) => { this.handleMessage(message) }, { scope: APPLICATION_SCOPE })
    }
    handleMessage(message) {
        this.recivedMessage = message.lmsData.value ? message.lmsData.value : 'No Message Published'
    }
    unsubscribeMessage() {
        unsubscribe(this.subscription)
        this.subscription = null
    }
}