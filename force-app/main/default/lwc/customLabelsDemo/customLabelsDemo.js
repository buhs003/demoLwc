import { LightningElement } from 'lwc';
import DESCRIPTION_ONE from '@salesforce/label/c.descriptionOne'
import DESCRIPTION_TWO from '@salesforce/label/c.discriptionTwo'
export default class CustomLabelsDemo extends LightningElement {
    Labels={
        descriptionOne :DESCRIPTION_ONE,
        discriptionTwo :DESCRIPTION_TWO

    }
   
}