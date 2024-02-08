import { LightningElement, wire } from 'lwc';
import {refreshApex} from '@salesforce/apex'
import getContacts from '@salesforce/apex/ContactSearch.getContacts'
export default class ContactList extends LightningElement {
    contacts
    searchKey=''

    @wire (getContacts)
    wiredContacts({data,error}){
        if(data){
            this.contacts = data;
            console.log(this.contacts);
        }else if(error){
            console.error = error
        }
    }
    get filteredContacts(){
        return this.contacts ? this.contacts.filter(contact => contact.Name.toLowerCase().includes(this.searchKey.toLowerCase())) : [];
      
    }
    handleSearch(event){
        this.searchKey = event.target.value;
    }
    handleRefresh(){
        refreshApex(this.contacts);
    }
}