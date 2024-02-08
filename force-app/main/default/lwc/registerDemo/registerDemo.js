import { LightningElement } from 'lwc';

export default class RegisterDemo extends LightningElement {

    firstName = 'Test';
    FirstNameHandler(event){
        this.firstName = event.target.value;
 
    }
    submitClickhandler(){
        // stringInterpolation
        console.log(`First name is -${this.firstName}`);
    }
}