import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
export default class RecordEditCustom extends LightningElement {
    //maping account with local property
    objectName = ACCOUNT_OBJECT
    inputValue = ''
    handelChange(event) {
        this.inputValue = event.target.value
    }
    handelSubmit(event) {
        event.preventDefault()
        //Input Field
        const inputCmp = this.template.querySelector('lightning-input')
        const value = inputCmp.value
        if (!value.includes('Australia')) {
            //error message we want to show.
            //seting the error message.
            inputCmp.setCustomValidity("The Account Name Must Include 'Australia'")
        } else {
            //here we hide the error or we remove the error message.
            inputCmp.setCustomValidity("")
            const fields = event.detail.fields
            //field api name Name.
            fields.Name = value
            //submitting programatically
            this.template.querySelector('lightning-record-edit-form').submit(fields)
        }
        //Throughing the error message.
        inputCmp.reportValidity()
    }
    sucessHandler(event) {
        const tostEvent = new ShowToastEvent({
            title: "Account created",
            message: "Record Id:" + event.detail.Id,
            variant: "success"
        })
        this.dispatchEvent(tostEvent)
    }
}