import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
export default class Notifications extends LightningElement {
    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title,
            message,
            variant,
            //data text url can be send from here.
            messageData:[
                'salesforce',{
                    url:'https://www.salesforce.com/',
                    label:'Click Here'
                }
            ],
            mode:'sticky'
        })
        this.dispatchEvent(event)
    }
    toastHandler() {
        this.showToast('Success!!', '{0}Account Created!!{1}', 'success')
    }
    toastHandlerTwo() {
        this.showToast('Error!!', 'Account Creation Failed!!', 'error')
    }
    toastHandlerThree(){
        this.showToast('Warning!!', 'Password Should be alpha numeric!!', 'warning')
    }
    toastHandlerFour(){
        this.showToast('Info!!', 'Summer 23 realease is available!!', 'info')

    }
}