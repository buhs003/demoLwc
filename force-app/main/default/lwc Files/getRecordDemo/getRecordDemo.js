import { LightningElement, wire, api } from 'lwc';
import { getRecord, getFieldValue, getFieldDisplayValue } from 'lightning/uiRecordApi';
import OWNER_NAME from '@salesforce/schema/Account.Owner.Name'
import AccNAME_FIELD from '@salesforce/schema/Account.Name'
import ANNUAL_REVENUE from '@salesforce/schema/Account.AnnualRevenue'
export default class GetRecordDemo extends LightningElement {
    name
    owner
    AnnualRevenue
    @api recordId
    //making Id daynamic so whenever the id is available it trigger the wire service.
    //the wire is now working on fields
    //if we want to work on selective 4-5 fields then go with fields type for the perticular record.
    @wire(getRecord, { recordId: '$recordId', fields: [OWNER_NAME, AccNAME_FIELD, ANNUAL_REVENUE] })
        //other type is using layout type
        //returns all the fields in this layout if we need all the fields then go with layout type.
        //@wire(getRecord,{recordId:'$recordId',layoutTypes:['Full'],modes:['View']})
    accountHandler({ data }) {
        if (data) {
            console.log(data)
                //using ternery operator if display value is their then show the data other wise show the value.
                // this.name = data.fields.Name.displayValue ? data.fields.Name.displayValue : data.fields.Name.value 
                // this.owner = data.fields.Owner.displayValue ? data.fields.Owner.displayValue : data.fields.Owner.value 
                // this.AnnualRevenue = data.fields.AnnualRevenue.displayValue ? data.fields.AnnualRevenue.displayValue : data.fields.AnnualRevenue.value 
                //Using getFieldvalue adapter
                //making the code code short.
                //need to pass whole data and then the field which we want to fetch.
            this.name = getFieldValue(data, AccNAME_FIELD)
            this.owner = getFieldValue(data, OWNER_NAME)
            this.AnnualRevenue = getFieldValue(data, ANNUAL_REVENUE)
                //here above the field is not in a format of displayValue for that we use another adapter ie getFieldDisplayValue.
                //here we jst change the function ie getFielddisplayValue()
            this.AnnualRevenue = getFieldDisplayValue(data, ANNUAL_REVENUE)

        }
    }
}