import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account'

import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry'
import TYPE_FIELD from '@salesforce/schema/Account.Type'


export default class GetPicklistValuesDemo extends LightningElement {
    SelectedIndustry = '';
    selectedType='';
    industryOptions = []
    typeOptions=[]
//getting defaultRecordtypeId from the metadata.
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    objectInfo

//adapter configuration.
    @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: INDUSTRY_FIELD })
    //fetching wire as a function.
    industryPicklist({ data, error }) {
        if (data) {
            console.log(data)
            this.industryOptions = [...this.generatePicklist(data)]
        } if (error) {
            console.error(error)
        }
    }

    generatePicklist(data) {
        return data.values.map(ite => ({ label: ite.label, value: ite.value }))

    }
    handleChange(event) {
        this.SelectedIndustry = event.detail.value;
    }
// second picklist for type
    @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: TYPE_FIELD })
    typePicklist({ data, error }) {
        if (data) {
            console.log(data)
            this.typeOptions = [...this.generatePicklist(data)]
        } if (error) {
            console.error(error)
        }
    }
    handleTypeChange(event) {
        this.selectedType = event.detail.value;
    }
}