import { LightningElement } from 'lwc';

export default class CustomLightningCard extends LightningElement {
    handleSlotFooterChange(){
        const footerElememt = this.template.querySelector('footer')
        if(footerElememt){
            //we can see use the method from classlist to remove unwanted on element.
            footerElememt.classList.remove('slds-hide')
        }
    }
}