import { LightningElement, track } from 'lwc';

export default class SimpleForm extends LightningElement {
    @track name = ''
    @track email = ''
    @track phone = ''

    get isFormInValid() {
        return !this.name || !this.email || !this.phone;
    }
    handleNameChange(event) {
        this.name = event.target.value;
    }
    handleEmailChange(event) {
        this.email = event.target.value;
    }
    handlePhoneChange(event) {
        this.phone = event.target.value;
    }
    handleSubmit() {
        if (!this.isFormInValid) {
            // Perform form submission logic here
            console.log('Form submitted successfully!');
            console.log('Name:', this.name);
            console.log('Email:', this.email);
            console.log('Phone:', this.phone);

            // Reset form fields
            this.name = '';
            this.email = '';
            this.phone = '';
        }

    }
}