import { LightningElement } from 'lwc';

export default class ChildComponentSample extends LightningElement {
    sendMessage() {
        const messageEvent = new CustomEvent('message', {
            detail: 'Hello from child!'
        });
        this.dispatchEvent(messageEvent);
    }
}