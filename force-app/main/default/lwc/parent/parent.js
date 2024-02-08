import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    message = 'Updated count will appear here';

    updatemessage(event) {
        this.message = event.detail.message;
    }
}