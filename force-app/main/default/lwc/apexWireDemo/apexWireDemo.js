import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/accountController.getAccountList'
export default class ApexWireDemo extends LightningElement {
    //function o/p
    accountList
   //property o/p
    @wire(getAccountList)
    accounts
    //here now using the function approch we 
    //are transforming the original data.
    @wire(getAccountList)
    accountsHandler({ data, error }) {
        if (data) {
            this.accountList = data.map(item => {
                //transformed data is stored in let.
                let newType = item.Type === 'Customer - Channel' ? 'Channel' :
                    item.Type === 'Customer - Direct' ? 'Direct' : '----------'
                return {...item, newType}
})
        }
        if (error) {
            console.error(error)
        }
    }
}