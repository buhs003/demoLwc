import { LightningElement, wire, api } from 'lwc';
import getContactList from '@salesforce/apex/VmsAccountClass_1.getContactList';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';
import { deleteRecord } from 'lightning/uiRecordApi';


import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class VmsContactDetail extends NavigationMixin(LightningElement) {
    wireRefreshPage
    Contacts
    @api recordID

    @wire(getContactList, {
        objectAPiName: CONTACT_OBJECT,
    })
    contactHandler(value) {
        this.wireRefreshPage = value;
        const { data, error } = value;
        if (data) {
            this.Contacts = data;
        }
        if (error) {
            console.error(error)
        }
    }
    handelClick() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            }
        })

    }
    handelDelete(event) {
        this.recordID = event.target.value;
        console.log('check deleted records>>>>>' +  this.recordID );
        deleteRecord(this.recordID).then((result) => {
                console.log('record deleted', result)
                const evt = new ShowToastEvent({
                    title: 'Success',
                    message: 'Record deleted sucessfully' + this.recordID,
                    variant: 'success',
                    mode: 'dismissable'
                });
                this.dispatchEvent(evt);
                return refreshApex(this.wireRefreshPage)
            })
            .catch(error => {
                console.error('error', error);
                const evt = new ShowToastEvent({
                    title: 'Error deleting records as its a primary Contact',
                    message: error.message,
                    variant: 'error',
                    mode: 'dismissable'
                });
                this.dispatchEvent(evt);

            })
    }
    handelView(){
        

    }
}