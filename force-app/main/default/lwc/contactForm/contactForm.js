import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ContactForm extends LightningElement {

    fields={}
    onchangeHandler(event){
        const{name,value} = event.target
        this.fields[name]=value
    }
    createContact(){
        const recordInput = {apiName: CONTACT_OBJECT.objectApiName, fields: this.fields}
        createRecord(recordInput).then(result =>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title:'Success',
                    message:'Contact Created SucessFully'+result.Id,
                    variant:'Success'
                })
            );
            this.clearfields()
           
        })
        .catch(error=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title:'Error',
                    message:'Contact Created Error',
                    variant:'Error'
                })
            )
        })
    }
        clearfields(){
            this.firstname=''
            this.lastname=''
            this.email=''
        
    }
}