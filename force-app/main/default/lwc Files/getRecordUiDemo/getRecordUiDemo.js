import { LightningElement, wire,api } from 'lwc';
import { getRecordUi } from 'lightning/uiRecordApi';
export default class GetRecordUiDemo extends LightningElement {
    formFields=[
        {"fieldName":"AccountNumber","lable":"Account Number"},
        {"fieldName":"AnnualRevenue","lable":"Annual Revenue"},
        {"fieldName":"Name","lable":"Name"},
        {"fieldName":"Phone","lable":"Phone"}
    ]
    //passing reactive recordId
    @api recordId
    @wire(getRecordUi,{recordIds:'$recordId',layoutTypes:'Full',modes:'Edit'})
    accountRecordUiHandler({data,error}){
        if(data){
            console.log(data);
            this.formFields = this.formFields.map(item=>{
                return {...item,value:data.records[this.recordId].fields[item.fieldName].value}
            })
            console.log('this.formFields ==> ' + JSON.stringify(this.formFields));
            
        }
        if(error){
            console.error(error)
        }
    }
}