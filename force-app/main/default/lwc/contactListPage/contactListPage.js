import { LightningElement,wire ,track } from 'lwc';
import getContacts from '@salesforce/apex/contactController.getContact'

const PAGE_SIZE = 10  // Number of records to display per page

export default class ContactListPage extends LightningElement {

    @track contacts = [];
    @track pageNumber = 1;
    @track disablePrevious = true;
    @track disableNext = false;

    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Email', fieldName: 'Email', type: 'email' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' }
    ]

    
    @wire(getContacts, { pageNumber: '$pageNumber', pageSize: PAGE_SIZE })
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.disablePrevious = this.pageNumber === 1;
            this.disableNext = data.length < PAGE_SIZE;
        } else if (error) {
            // Handle error
        }
    }
    handlePrevious() {
        this.pageNumber--;
    }

    handleNext() {
        this.pageNumber++;
    }
}