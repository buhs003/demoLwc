import { LightningElement, api, track, wire } from 'lwc';
import searchAccountrecord from '@salesforce/apex/VmsAccountClass_1.searchAccountrecord';
import delAccount from '@salesforce/apex/VmsAccountClass_1.delAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAccountList from '@salesforce/apex/VmsAccountClass_1.getAccountList';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';
import { deleteRecord } from 'lightning/uiRecordApi';



export default class VmAccountRecordPage extends NavigationMixin(LightningElement) {
    wireRefreshPage
    @api keyWord = '';
    @track Accounts = [];
    @api recordId
    showAccountRecordDetails
    


    @wire(getAccountList, {
        objectApiName: ACCOUNT_OBJECT,
    })
    accountHandler(value) {
        this.wireRefreshPage = value;
        const { data, error } = value;
        if (data) {
            this.Accounts = data;
        }
        if (error) {
            console.error(error)
        }
    }

    handelSearch(event) {
        this.keyWord = event.target.value
        searchAccountrecord({ searchKey: this.keyWord })
            .then(response => {
                this.Accounts = response
            }).catch(error => {
                console.error(error)
            })
    }

    handelClick() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
            }
        })

    }

    handelView(event) {
        this.showAccountRecordDetails = event.target.value;
        console.log('event====' + JSON.stringify(this.showAccountRecordDetails));
        //navigating to next page
        var Definition = {
            componentDef: 'c:vmAccountRecordViewPage',
            attributes: {
                recordId: this.showAccountRecordDetails
                
            }
        }
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            //recived Definition
            attributes: {
                url: '/one/one.app#' + btoa(JSON.stringify(Definition))
            }
        })

    }
    handelEdit(event) {
        this.recordId = event.target.value
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
                objectApiName: 'Account',
                actionName: 'edit'
            }
        })
    }

    handelDelete(event) {
        this.recordId = event.target.value;
        console.log('check deleted records>>>>>' + JSON.stringify(this.recordId));
        deleteRecord(this.recordId).then((result) => {
            const evt = new ShowToastEvent({
                title: 'Success',
                message: 'Record deleted Sucessfully' + this.recordId,
                variant: 'success',
                mode: 'dismissable'
            });
            this.dispatchEvent(evt);
            return refreshApex(this.wireRefreshPage)

        })
            .catch(error => {
                console.error(error);
                const evt = new ShowToastEvent({
                    title: 'Error deleting records',
                    message: error.message,
                    variant: 'error',
                    mode: 'dismissable'
                });
                this.dispatchEvent(evt);
            })
    }
}