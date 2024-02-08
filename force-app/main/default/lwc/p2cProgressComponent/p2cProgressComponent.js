import { LightningElement,api } from 'lwc';

export default class P2cProgressComponent extends LightningElement {
    //we want to catch the data from the parent then need to decorate the property to public.
    @api progressValue 
}