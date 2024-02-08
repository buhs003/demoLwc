import { LightningElement, api, wire } from 'lwc';
import getRelatedFilesByRecordId from '@salesforce/apex/VmsAccountClass_1.getRelatedFilesByRecordId';
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import NAME_FIELD from '@salesforce/schema/Account.Name'
import PHONE_FIELD from '@salesforce/schema/Account.Phone'
import WEBSITE_FIELD from '@salesforce/schema/Account.Website'
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry'
import { refreshApex } from '@salesforce/apex';
import { deleteRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';




export default class VmAccountRecordViewPage extends NavigationMixin(LightningElement) {
    Contacts
    activeSectionsMessage
    @api recordId
    objectApiName
    objectName = ACCOUNT_OBJECT
    wireRefreshPage
    filesList = [];
    fieldList = [NAME_FIELD, PHONE_FIELD, WEBSITE_FIELD, INDUSTRY_FIELD]

    activeSections = ['A'];
    activeSectionsMessage = '';

    handleSectionToggle(event) {
        const openSections = event.detail.openSections;

        if (openSections.length === 0) {
            this.activeSectionsMessage = 'All sections are closed';
        } else {
            this.activeSectionsMessage =
                'Open sections: ' + openSections.join(', ');
        }
    }
   
    @wire(getRelatedFilesByRecordId, { recordId: '$recordId' })
    wireResult(value) {
        this.wireRefreshPage = value;
        const{data,error} = value;
        if (data) {
            console.log("View data" + data)
            this.filesList = Object.keys(data).map(item => ({
                "label": data[item],
                "value": item,
                "url": `/sfc/servlet.shepherd/document/download/${item}`
            }))
            console.log(this.filesList)
        }
        if (error) {
            console.log(error)
        }
        return refreshApex(this.wireRefreshPage)
    }
    previewHandler(event) {
        console.log(event.target.dataset.id)
        this[NavigationMixin.Navigate]({
            type: 'standard__namedPage',
            attributes: {
                pageName: 'filePreview'
            },
            state: {
                selectedRecordId: event.target.dataset.id
            }
        })


    }
    handleDeletefile(event) {
        this.deletedFilerecordId = event.target.dataset.id
            console.log('check deleted fileRecords>>>>>' + this.deletedFilerecordId);
            deleteRecord(this.deletedFilerecordId)
            .then((result) => {
                    console.log('File deleted', result)
                    // showSuccessToast()
                    const evt = new ShowToastEvent({
                        title: 'Success',
                        message: 'File deleted sucessfully' + this.deletedFilerecordId,
                        variant: 'success',
                        mode: 'dismissable'
                    });
                    this.dispatchEvent(evt);
                    return refreshApex(this.wireRefreshPage)
                })
                .catch(error => {
                    console.error('error', error);
                    const evt = new ShowToastEvent({
                        title: 'Error deleting records',
                        message: error.message,
                        variant: 'error',
                        mode: 'dismissable'
                    });
                    this.dispatchEvent(evt);
                })
        }
        previewHandler(event) {
            console.log(event.target.dataset.id)
            this[NavigationMixin.Navigate]({
                type: 'standard__namedPage',
                attributes: {
                    pageName: 'filePreview'
                },
                state: {
                    selectedRecordId: event.target.dataset.id
                }
            })
        }

        handleUploadFinished(event) {
            return refreshApex(this.wireRefreshPage)
        }
        
    }