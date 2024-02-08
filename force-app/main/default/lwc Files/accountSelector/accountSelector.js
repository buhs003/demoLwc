import { LightningElement,wire } from 'lwc';
import {refreshApex} from '@salesforce/apex';
import getAccounts from '@salesforce/apex/AccountController.getAllaccount';

const columns = [
    {label:'Account Name',fieldName:'Name',type:'text'},
    {label:'Industry',fieldName:'Industry',type:'picklist'},
    {label:'Phone',fieldName:'Phone',type:'Phone'}
    
];
export default class AccountSelector extends LightningElement {
    accounts=[];
    selectedRows=[];
    selectedAccounts=[];


    @wire (getAccounts)
    wiredAccount({data,error}){
        if(data){
            this.accounts = data;
            console.log(this.accounts);
        }else if (error){
            console.log(error);
        }
    }

    get columns(){
        return columns;
    }
    handleRowSelection(event){
        this.selectedRows = event.detail.selectedRows;
        this.selectedAccounts = this.selectedRows;
    }

    refreshAccounts(){
        return refreshApex(this.wiredAccount);
    }
}