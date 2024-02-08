import { LightningElement, wire, track, api } from 'lwc';
import getVmsOpportunityList from '@salesforce/apex/VmsAccountClass_1.getVmsOpportunityList';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import { NavigationMixin } from 'lightning/navigation';
import searchRecordForOpp from '@salesforce/apex/VmsAccountClass_1.searchRecordForOpp';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import loadOppData from '@salesforce/apex/VmsAccountClass_1.loadOppData';
import ALLREQFIELD from '@salesforce/resourceUrl/OppDataFormat';


export default class VmsContactRecordPage extends NavigationMixin(LightningElement) {
    deletedrecordId
   @api recordId
    @api keyword
    wiredRecords
    @track Opportunities = [];




    urlForOpp = ALLREQFIELD + '/OppDataFormat.csv';
    get accepetedFormats() {
        return ['.csv'];
    }
    uplodeFileHandler(event) {
        // Get the list of records from the uploaded files
        const uploadedFiles = event.detail.files;
        // calling apex class csvFileread method
        loadOppData({ contentDocumentId: uploadedFiles[0].documentId })
            // console.log("uploadedFiles[0].documentId ==>" + uploadedFiles[0].documentId)
            .then(result => {
                console.log('file upload result 1 ===> ' + result);
                // this.isLoaded = false;
                console.log('file upload result ===> ' + result);
                this.strOppMessage = result;
                console.log("this.strOppMessage" + JSON.stringify(this.strOppMessage));
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success !!',
                        message: "Opp Records Imported Successfully !!!",
                        variant: "Success",
                        mode: 'sticky'
                    }),

                );
                return refreshApex(this.wiredRecords)

            })
            .catch(error => {
                console.log("this.strOppMessage>>>" + JSON.stringify(error));
                this.errorForAcc = error;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error!!',
                        message: "Some error occured in Opp.",
                        variant: 'error',
                        mode: 'sticky'
                    }),
                );
            })
    }
    //get Opp Records
    @wire(getVmsOpportunityList, {
        objectApiName: OPPORTUNITY_OBJECT,
    })
    oppHandler(value) {
        this.wiredRecords = value;
        const { data, error } = value;
        if (data) {
            console.log(data)
            this.Opportunities = data;
        }
        if (error) {
            console.error(error)
        }
    }
    handelSearch(event) {
        this.keyword = event.target.value;

        searchRecordForOpp({ searchKey: this.keyword })
            .then(response => {
                this.Opportunities = response;
            })
            .catch(error=>{[
                console.error(error)
            ]})
    }
    handleClick(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Opportunity',
                actionName:'new'
            },
            
         });
    }
    handleView(event){
        this.recordId = event.target.value
        this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
            attributes:{
                recordId:this.recordId,
                objectApiName:'Opportunity',
                actionName:'view',
            },
            
         });
         return refreshApex(this.wiredRecords)
    }
    handleEdit(event){
        this.recordId=event.target.value;
        this[NavigationMixin.Navigate]({
        type:'standard__recordPage',
        attributes:{
            recordId:this.recordId,
            objectApiName:'Opportunity',
            actionName:'edit'
        }
        })
        return refreshApex(this.wiredRecords)
    
    }
    
handleDelete(event){
    this.deletedrecordId = event.target.value;
    console.log ('check deleted records>>>>>'+this.deletedrecordId);
    deleteRecord(this.deletedrecordId)
    .then(result=>{
        console.log('record deleted',result)
         // showSuccessToast()
         const evt = new ShowToastEvent({
            title: 'Success',
            message: 'Record deleted sucessfully'+this.deletedrecordId,
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
        return refreshApex(this.wiredRecords)
    })
    .catch(error=>{
        console.error('error',error);
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