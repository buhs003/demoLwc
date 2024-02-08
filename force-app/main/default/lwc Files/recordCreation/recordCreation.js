import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import { createRecord } from 'lightning/uiRecordApi';

export default class RecordCreation extends LightningElement {

    @api objectApiName
    @track firstName = ''
    @track lastName = ''

    handleClick(event) {

        // this.firstName = event.target.value
        // this.lastName = event.target.value
       if (!this.firstName || !this.lastName) {
            console.log('inside if')
            this.ShowToast('Error', 'Please Fill in all required fields', 'error')
            return
       }
        const recordInput = {
            apiName: this.objectApiName,
            fields: {
                FirstName: this.firstName,
                LastName: this.lastName
            }

        }
        createRecord(recordInput).then(result => {

            this.ShowToast('Success', 'Record Created Sucessfully', 'scuccess')
            this.firstName = ''
            this.lastName = ''

        })
            .catch(error => {
                this.ShowToast('Error', 'Error Creating Records' + error.body.message, 'Error')
            })
    }

    ShowToast(title, message, variant) {
        const toastEvent = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        })
        this.dispatchEvent(toastEvent);
    }
}