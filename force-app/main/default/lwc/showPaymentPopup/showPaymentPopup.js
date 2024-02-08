import { LightningElement, track, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import senPaymentLink from '@salesforce/apex/PaymentUtility.senPaymentLink';
import createPaymentRequest from '@salesforce/apex/PaymentUtility.createPaymentRequest';
import getStringBody from '@salesforce/apex/PaymentUtility.getStringBody';
import getPaymentDetsils from '@salesforce/apex/PaymentUtility.getPaymentDetsils';
import { notifyRecordUpdateAvailable } from "lightning/uiRecordApi";

const FIELDS = [
    'Contact.Name',
    'Contact.Title',
    'Contact.Phone',
    'Contact.Email',

];
export default class ShowPaymentPopup extends LightningElement {

    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    contact;

    @track isModalOpen = false;

    @track
    amount

    handleChange(event) {

        this.amount = event.target.value;
    }

    get name() {
        return this.contact.data.fields.Name.value;
    }

    get title() {
        return this.contact.data.fields.Title.value;
    }

    get phone() {
        return this.contact.data.fields.Phone.value;
    }

    get email() {
        return this.contact.data.fields.Email.value;
    }


    openModal() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen = true;
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
    }
    submitDetails() {
        // to close modal set isModalOpen tarck value as false
        //Add your code to call apex method or do some processing
        this.isModalOpen = false;
        this.handleSubmit();
    }

    handleSubmit() {
        //alert(this.panNumber)

        createPaymentRequest({ amount: this.amount, contactId: this.recordId }).then((response) => {

            console.log('record created successfully' + JSON.stringify(response));
            //console.log(response.Id)
            this.senPaymentLink(response.Id);
            // console.log(JSON.stringify(this.senPaymentLink(response.Id)));

        }).catch((error) => {
            console.log('record created error' + error);
        })
    }


    senPaymentLink(referenceId) {
        console.log('referenceId' + JSON.stringify(referenceId));
        notifyRecordUpdateAvailable([{ recordId: referenceId }]);
        this.getPaymentDetails(referenceId);
        console.log(referenceId);
        //console.log(this.getPaymentDetails(referenceId));

    }

    getPaymentDetails(referenceId) {

        getPaymentDetsils({ referenceId: referenceId }).then((paymentDetails) => {
            console.log("paymentDetails " + JSON.stringify(paymentDetails));
            //console.log(JSON.stringify(paymentDetails));
            this.genarateRequestBody(paymentDetails);

        }).catch((error) => {
            console.log('Error in getting the payment detsils' + error);
        })

    }

    genarateRequestBody(paymentDetails) {


        getStringBody({}).then((response) => {
            //console.log("Request string " + JSON.stringify(response));
            let requestObject = JSON.parse(response);
            console.log(JSON.stringify(requestObject));
            requestObject.amount = paymentDetails.Amount__c * 100;
            requestObject.reference_id = paymentDetails.Id;
            requestObject.customer.Name = paymentDetails.Customer__r.Name;
            requestObject.customer.email = paymentDetails.Customer__r.Email;
            requestObject.customer.contact = paymentDetails.Customer__r.Phone;

            console.log(JSON.stringify(requestObject));
            senPaymentLink({ requestString: JSON.stringify(requestObject) }).then(() => {

                console.log('link sent successfully ' + JSON.stringify(requestObject));
                //alert('link sent successfully'+JSON.stringify(response));
                this.showToast('Sucess', 'Link sent successfully on the contact email and  phone', 'success');

            }).catch((error) => {
                console.log(error);
            })
        }).catch((error) => {
            console.log(error);
        })
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }

}