import { LightningElement, wire } from 'lwc';
import getAllaccount from '@salesforce/apex/accountController.getAllaccount'
export default class AccountListSample extends LightningElement {
    accounts

    @wire(getAllaccount)
    wiredAccount({ data, error }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.log('Error Fetching the Accounts' + error);
        }
    }
}