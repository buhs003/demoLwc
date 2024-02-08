import { LightningElement, api } from 'lwc';
import getPrimaryContact from '@salesforce/apex/VmsAccountClass_1.getPrimaryContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class VmsAccountPrimaryContact extends LightningElement {
    @api recordId;
    conTempArray = [];
    contactData = []

    connectedCallback() {
        getPrimaryContact({ recId: this.recordId }).then(result => {
            let tempRecords = result;
            let temp = tempRecords.map(row => {
                // Object.assign copy the values and properties 
                //from one or more source objects to a target object
                return Object.assign({ ConName: row.Contacts })
            })
            temp.forEach(element => {
                this.conTempArray = element.ConName;
            });
            this.contactData = this.conTempArray;
        })
            .catch(error => {
                console.log(error);
            })
    }

}