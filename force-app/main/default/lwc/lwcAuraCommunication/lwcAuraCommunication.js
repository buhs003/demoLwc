import { LightningElement, api } from 'lwc';

export default class LwcAuraCommunication extends LightningElement {
    @api title

    callAura() {
        const event = new CustomEvent('sendmsg', {
            //2nd para
            detail: {
                "msg": "Hello From LWC"
            }
        })
        this.dispatchEvent(event)
    }
}