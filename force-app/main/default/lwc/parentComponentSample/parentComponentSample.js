import { LightningElement } from 'lwc';

export default class ParentComponentSample extends LightningElement {
    showChild() {
        const childEvent = new CustomEvent('showchild');
        this.dispatchEvent(childEvent);
    }

    handleChildMessage(event) {
        const message = event.detail;
        console.log('Message from child:', message);
    }
}