import { LightningElement,api } from 'lwc';

export default class P2cAlertComponent extends LightningElement {
    //this property has a power to recive the data.
    @api message
    @api cardHeading
    @api number
    @api isValid

}