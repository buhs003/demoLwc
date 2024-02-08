import { LightningElement,wire } from 'lwc';
import { getObjectInfo ,getObjectInfos} from 'lightning/uiObjectInfoApi';
import Invoice from '@salesforce/schema/InvoiceDetails__c'
export default class PdfCreator extends LightningElement {

    @wire(getObjectInfo, { objectApiName: Invoice })
    objInfo

    objInfo({ data, error }){
        if(data){
        console.log(data)
        this.defaultRecordTypeId = data.defaultRecordTypeId
        }
    } if(error) {
        console.error(error)
    }
}
    // objectApiName = [ACCOUNT_OBJECT,OPPORTUNITY_OBJECT]
    // objectInfos
    // //its reactive because as acc or opp may come first.
    // @wire(getObjectInfos,{objectApiNames:'$objectApiName' })
    // objectInfoHandler({data}){
    //     if(data){
    //         console.log(data)
    //         this.objectInfos = data
    //     }

    // }