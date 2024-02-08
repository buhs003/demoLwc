import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact'
import{ ShowToastEvent } from 'lightning/platformShowToastEvent'
export default class CreateRecordDemo extends LightningElement {
    formFields={}
    //every event has a name and its value.
    changeHandler(event) {
        const { name, value } = event.target
        //adding name and value in form fields.
        this.formFields[name]=value
    }
    createContact(){
        //passing the contact object and the fields which we have recived in event.
        const recordInput = {apiName:CONTACT_OBJECT.objectApiName,fields:this.formFields}
        //then it will return a promice by then() and it will return a created recordId.
        createRecord(recordInput).then(result=>{
            //used string propelation.
            this.showToast('Success!!',`Contact created with is ${result.id}`)
            //calling a class from the form we created and calling reset() on it 
            this.template.querySelector('form.createForm').reset()
            //making our formFields empty.
            this.formFields={}
        }).catch(error=>{
            //showToast method will catch the error and 
            //will show it in the form of title,message,variant Green/Red.
            this.showToast('Error Creating record',error.body.message,'error')
        })
    }
    showToast(title,message,variant){
        this.dispatchEvent(new ShowToastEvent({
            title,
            message,
            variant:variant || 'success'
        }))
    }
}