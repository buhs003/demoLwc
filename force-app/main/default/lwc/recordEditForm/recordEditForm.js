import { LightningElement ,api } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

import NAME_FIELD from '@salesforce/schema/Contact.Name'
import TITLE_FIELD from '@salesforce/schema/Contact.Title'
import PHONE_FIELD from '@salesforce/schema/Contact.Phone'
import EMAIL_FIELD from '@salesforce/schema/Contact.Email'
import ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId'
export default class RecordEditForm extends LightningElement {
    @api objectApiName;
    @api recordId;
    objectName = CONTACT_OBJECT
    fields={
        
        accountIdField:ACCOUNTID_FIELD,
        nameField:NAME_FIELD,
        titleField:TITLE_FIELD,
        phoneField:PHONE_FIELD,
        emailField:EMAIL_FIELD
    }
    handelReset(){
        const inputFields = this.template.querySelectorAll('lightning-input-field')
        if(inputFields){
            Array.from(inputFields).forEach(Field=>{
                Field.reset()
            })
        }
    }
    

}