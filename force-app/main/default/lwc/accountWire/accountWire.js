import { LightningElement,wire } from 'lwc';

import getAllaccount from '@salesforce/apex/accountController.getAllaccount';
export default class AccountWire extends LightningElement {
    @wire(getAllaccount)
    accounts
    
}