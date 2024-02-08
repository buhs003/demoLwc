import { LightningElement } from 'lwc';

export default class C2pModalComponent extends LightningElement {
    closehandler(){
        const myCustomEvent = new CustomEvent('close',{
            bubbles:true,
            detail:"Model Closed Sucessfully"
        })
        this.dispatchEvent(myCustomEvent)
    }
    footerHandler(){
        console.log('FooterHandler Called')
    }
}