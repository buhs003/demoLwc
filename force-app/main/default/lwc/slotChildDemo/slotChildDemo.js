import { LightningElement } from 'lwc';

export default class SlotChildDemo extends LightningElement {
    handleFooterChange(){
        const footerElememt = this.template.querySelector('.slds-card__footer')
        //calling footer element
        if(footerElememt){
            //footer element class list.
            footerElememt.classList.remove('slds-hide')
        }
    }
}