import { LightningElement, wire } from 'lwc';
import { getListUi } from 'lightning/uiListApi';
import { updateRecord } from 'lightning/uiRecordApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact'
//here the coloums are hard coded and passed in COLS.
//field name are the fields which have a field API Name in the data.
const COLS = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' },
    { label: 'Title', fieldName: 'Title' },
    { label: 'Phone', fieldName: 'Phone', editable: true },
    { label: 'Email', fieldName: 'Email', type: 'Email', editable: true }
]
export default class UpdateRecordDemo extends LightningElement {
//contacts property is used as data.
    contacts = []
    //hard coded fields to show are stored here.
    coloums = COLS
    draftValues = []
    @wire(getListUi, {
        objectApiName: CONTACT_OBJECT,
        listViewApiName: 'AllContacts'
    })
    listViewHandler({ data, error }) {
        if (data) {
            //passing the contacts records in the propertry
            this.contacts = data.records.records.map(item => {
                console.log( ' this.contacts '+this.contacts );
                return {
                    //specifiying a specific field in return.
                    "Id": this.getvalue(item, 'Id'),
                    "Name": this.getvalue(item, 'Name'),
                    "Title": this.getvalue(item, 'Title'),
                    "Phone": this.getvalue(item, 'Phone'),
                    "Email": this.getvalue(item, 'Email')
                }
            })
        }
        if (error) {
            console.error(error)
        }
    }
    //it will recive data and field.
    getvalue(data, field) {
        return data.fields[field].value
    }
    handleSave(event) {
        //values which are updated but not saved in database.
        console.log(JSON.stringify(event.detail.draftValues))
        
        const recordInputs = event.detail.draftValues.map(draft => {
            //storing all drafts in the fields.
            const fields = { ...draft }
            //maping draft fields as a return in fields.
            return { fields: fields }
        })
        //now further to update the record need to initilize the updateRecord 
        //adapter which will recive recordInput.
        //by map from all recordInputs each recordInput is picked up 
        //and passed to update in updateRecord().
        const promises = recordInputs.map(recordInput => updateRecord(recordInput))
        //Promise allows you to associate asynchronous action's 
        //as a  success value or failure reason
        Promise.all(promises).then(() => {
            console.log('Contact updated sucessfully')
            //cleard the draft.
            this.draftValues=[]
        }).catch(error => {
            console.error("Error in updating the record", error)
        })
    }
}