import { LightningElement, wire } from 'lwc';
import { getListUi } from 'lightning/uiListApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact'
import TITLE_FIELD from '@salesforce/schema/Contact.Title'


export default class GetListUiDemolwc extends LightningElement {
    contacts=[]
    //When a user clicks the Previous and Next buttons, 
    //the pageToken parameter is updated to the previousPageToken 
    //and nextPageToken values from the data the wire service provisioned. 
    //Because pageToken is prepended with $,
    // when its value changes the wire service provisions new data
    pageToken = null
    nextPageToken = null
    previousPageToken = null
    @wire(getListUi, { objectApiName: CONTACT_OBJECT, 
        listViewApiName: 'AllContacts',
        pageSize:10,
        sortBy:TITLE_FIELD, 
        pageToken:'$pageToken'
    })
    listViewHandler({ data, error }) {
        if (data) {
            console.log((data))
            this.contacts = data.records.records
            this.nextPageToken = data.records.nextPageToken
            this.previousPageToken = data.records.previousPageToken
        }
        if(error){
            console.error(error)
        }
    }
    handlePreviousPage(){
        this.pageToken = this.previousPageToken

    }
    handleNextPage(){
        this.pageToken = this.nextPageToken

    }

}