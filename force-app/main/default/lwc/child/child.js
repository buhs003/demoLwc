import { LightningElement } from 'lwc';

export default class Child extends LightningElement {

    count = 0;
    increaseCount() {
        this.dispatchEvent(new CustomEvent('increasecount', {
            detail: {
                message: 'Increased Count to ' + (++this.count)
            }
        }));
    }
}