import { LightningElement, track } from 'lwc';
import createContactRecord from '@salesforce/apex/contactController.createContactRecord';

export default class CreateContactRecordSample extends LightningElement {


    @track firstName = '';
    @track lastName = '';
    @track emailValue = '';

    FirstNameChangeHandler(event) {
        this.firstName = event.target.value;
        // console.log(this.firstName);

    }
    LastNameChangeHandler(event) {
        this.lastName = event.target.value;
        // console.log(this.lastName);

    }
    EmailChangeHandler(event) {
        this.emailValue = event.target.value;
        //console.log(this.Email);
    }

    createContactHandler() {
        if (this.firstName && this.lastName && this.emailValue) {
            createContactRecord({ FirstName: this.firstName, LastName: this.lastName, Email: this.emailValue })
                .then(result => {
                    this.firstName = '';
                    this.lastName = '';
                    this.emailValue = '';
                    console.log('New Contact Record Created ' + json.JSON.stringify(result));
                })
                .catch(error => {
                    console.error('Error Creating Contact' + error);
                })
        }
    }

}