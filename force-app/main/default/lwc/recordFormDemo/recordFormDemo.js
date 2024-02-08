import { LightningElement, api } from 'lwc';
//importing power to show tost.
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
//acc obj
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
//fields
import NAME_FIELD from '@salesforce/schema/Account.Name'
import ANNUAL_REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue'
import TYPE_FIELD from '@salesforce/schema/Account.Type'
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry'

export default class RecordFormDemo extends LightningElement {
    // @api recordId
    // @api objectApiName
    objectName = ACCOUNT_OBJECT
    fieldList = [NAME_FIELD,ANNUAL_REVENUE_FIELD,TYPE_FIELD,INDUSTRY_FIELD]

    sucessHandler(event){
        console.log(event.detail.id)

       const toastEvent =  new ShowToastEvent({
            title:"Account created",
            message:"RecordId: "+event.detail.id,
            variant:'success'
        })
        this.dispatchEvent(toastEvent)
    }
}