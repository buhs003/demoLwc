import { LightningElement } from 'lwc';
import {RefreshEvent} from 'lightning/refresh'
import NAME_FIELD from '@salesforce/schema/Contact.Name'
import PHONE_FIELD from '@salesforce/schema/Contact.Phone'
import EMAIL_FIELD from '@salesforce/schema/Contact.Email'
import ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId'

export default class RefreshStandardView extends LightningElement {

    nameField = NAME_FIELD
    phoneField = PHONE_FIELD
    emailField = EMAIL_FIELD
    accountField = ACCOUNTID_FIELD

    handelSucess(event){
        console.log("Contact Created Id-->",event.detail.Id);

        this.dispatchEvent(new RefreshEvent())
    }

}