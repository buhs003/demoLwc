import { LightningElement } from 'lwc';
import getAccountList from '@salesforce/apex/accountController.getAccountList'
export default class ApexImparetiveDemo extends LightningElement {
    accounts

    handelClick(){
        //the promice can be resolved by then().
        getAccountList().then((result)=>{
            console.log(result)
            this.accounts = result
        }).catch(error=>{
            console.error(error)
        })
    }
}