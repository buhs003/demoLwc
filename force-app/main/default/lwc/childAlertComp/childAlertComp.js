import { LightningElement,api } from 'lwc';

export default class ChildAlertComp extends LightningElement {
    @api message
    @api cardhead
    @api number
    @api isValid
}