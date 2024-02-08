import { LightningElement, wire, api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ANNUAL_REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

const FIELDS = [NAME_FIELD, INDUSTRY_FIELD, ANNUAL_REVENUE_FIELD];



export default class AccountList extends LightningElement {
    accounts;
    error;
  
    columns = [
        { label: 'Name', fieldName: 'Name', sortable: true },
        { label: 'Industry', fieldName: 'Industry', sortable: true },
        { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency', sortable: true },
    ];
    //gives matadata  
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountObjectInfo;


    @wire(getRecord, { recordId: '$accountObjectInfo.data.defaultRecordTypeId', fields: FIELDS})
    wiredAccounts({ error, data }) {
        if (data) {
            console.log(JSON.stringify(data));
            this.accounts = [{
                Id: '0015i00000RGES2AAP', // Replace with the actual Account Id
                Name: data.fields.Name.value,
                Industry: data.fields.Industry.value,
                AnnualRevenue: data.fields.AnnualRevenue.value,
            }];
            this.error = null;
        } else if (error) {
            this.accounts = null;
            this.error = error;
        }
    }
}



