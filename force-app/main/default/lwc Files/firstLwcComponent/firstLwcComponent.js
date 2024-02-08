import { LightningElement } from 'lwc';

export default class FirstLwcComponent extends LightningElement {
    name = 'Shubham Mali';
    updateName(event){
       // console.log('onchange Called');
        this.name = event.target.value;
        console.log(this.name);
    }
}