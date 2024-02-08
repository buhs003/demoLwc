import { LightningElement, wire } from 'lwc';
import { getObjectInfo ,getObjectInfos} from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity'
export default class GetObjectInfoDemo extends LightningElement {
    // defaultRecordTypeId
    //we need objectApiName as a configuration.
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    objInfo
    // objInfo({ data, error }){
    //     if(data){
    //     console.log(data)
    //     this.defaultRecordTypeId = data.defaultRecordTypeId
    //     }
    // } if(error) {
    //     console.error(error)
    // }
    objectApiName = [ACCOUNT_OBJECT,OPPORTUNITY_OBJECT]
    objectInfos
    //its reactive because as acc or opp may come first.
    @wire(getObjectInfos,{objectApiNames:'$objectApiName' })
    objectInfoHandler({data}){
        if(data){
            console.log(data)
            this.objectInfos = data
        }

    }

}