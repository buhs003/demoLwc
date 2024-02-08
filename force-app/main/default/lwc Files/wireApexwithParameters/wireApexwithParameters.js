import { LightningElement, wire } from 'lwc';
import filterAccountType from '@salesforce/apex/accountController.filterAccountType'
export default class WireApexwithParameters extends LightningElement {
    //we can fetch Account by  wire by invoking apex class 
    selectedType=''
    @wire(filterAccountType,{type:'$selectedType'})
    filteredAccounts

    get typeOptions(){
        return [
            {label:"Customer - Channel",value:'Customer - Channel'},
            {label:"Customer - Direct",value:'Customer - Direct'}
        ]
    }
    typeHandler(event){
        this.selectedType = event.target.value
    }
}