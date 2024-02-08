import { LightningElement } from 'lwc';
import pubSub from 'c/pubSub';
export default class PubsubComponentA extends LightningElement {
    message
    inputHandler(event) {
        this.message = event.target.value
    }
    publishHandler(){
        pubSub.publish('component A',this.message)
    }
}