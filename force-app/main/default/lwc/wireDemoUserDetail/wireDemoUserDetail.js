import { LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id'
import NAME_FIELD from '@salesforce/schema/User.Name'
import EMAIL_FIELD from '@salesforce/schema/User.Email'
const fields = [NAME_FIELD, EMAIL_FIELD]
export default class WireDemoUserDetail extends LightningElement {
    userId = Id
    userDetail
    userDetailProperty
    //wire is reactive once the data available it immeditly updates it.
    // @wire(adapter, adapterConfig)
    // propertyorfunction
    // @wire(getRecord, { recordId: '0051m000004WtVzAAK', fields: ['User.Name', 'User.Email'] })
    //@wire(getRecord, { recordId: '0051m000004WtVzAAK', fields}) 
    //making id dynamic as wire is reactive.
    @wire(getRecord, { recordId: '$userId', fields })
    // userDetailHandler(response) {
    //     console.log(response)
    
    //function approch 
    userDetailHandler({ data, error }) {
        if (data) {
            this.userDetail = data.fields

        } if (error) {
            console.error(error)
        }
    }
    //property apporoch.
    @wire(getRecord, { recordId: '$userId', fields })
    userDetailProperty
}