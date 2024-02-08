// recordDetails.js
import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class RecordDetailsSample extends LightningElement {
    accounts
    @api recordId; // Provided record Id
    @wire(getRecord, { recordId: '$recordId', fields: [NAME_FIELD, INDUSTRY_FIELD, ANNUALREVENUE_FIELD] })
    accounts({ data }) {
        if (data) {
            this.accounts = data
            console.log(JSON.stringify(data));
            // this.name = getFieldValue(data.fields, NAME_FIELD)
            // this.industry = getFieldValue(data.fields, INDUSTRY_FIELD)
            // this.annualrevenue = getFieldValue(data.fields, ANNUALREVENUE_FIELD)
        }

    }
    get accountName() {
        return getFieldValue(this.accounts, NAME_FIELD);
    }

    get accountIndustry() {
        return getFieldValue(this.accounts, INDUSTRY_FIELD);
    }

    get accountAnnualRevenue() {
        return getFieldValue(this.accounts, ANNUALREVENUE_FIELD);
    }
}