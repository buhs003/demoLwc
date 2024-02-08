import { LightningElement } from 'lwc';
import pubSub from 'c/pubSub';
export default class PubsubComonentB extends LightningElement {
    message
    //on load
    connectedCallback(){
        this.callSubscriber()
    }
    callSubscriber(){
        pubSub.subscribe('component A', (message)=>{
            this.message = message
        })
    }
}