import { LightningElement,api } from 'lwc';

export default class SetterDemoChild extends LightningElement {
   // @api detail
    //the above public property will recive the data from parent.
    userDetail
    @api
    get detail(){
        return this.userDetail

    }
    set detail(data){
        let newAge = data.age*2
        this.userDetail = {...data,age:newAge,"location":"melbourne"}
    }
}