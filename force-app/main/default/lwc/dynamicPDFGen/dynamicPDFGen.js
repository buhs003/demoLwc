import { LightningElement, wire, api } from 'lwc';
import { getRecordUi } from 'lightning/uiRecordApi';
export default class dynamicPDFGen extends LightningElement {
    imageUrl = 'https://www.google.com/images/logo.png'
    formFields=[
        {fieldName:"InvoiceNo__c","label":"Invoice No"},
        {fieldName:"InvoiceCreatedDate__c","label":"Invoice Created Date"},
        {fieldName:"InvoiceDueDate__c","label":"Invoice Due Date"},
        {fieldName:"Address1__c","label":"Address Line 1"},
        {fieldName:"Address2__c","label":"Address Line 2"},
        {fieldName:"CompanyName__c","label":"Company Name"},
        {fieldName:"CompanyUrl__c","label":"Company Url"},
        {fieldName:"Company_Phone__c","label":"Company Phone"},
        {fieldName:"CoustomerName__c","label":"Client Name"},
        {fieldName:"CoustomerEmail__c","label":"Client Email"},
        {fieldName:"CoustomerPhone__c","label":"Client Phn"},
        {fieldName:"CoustomerAddress__c","label":"Client Address"},
        {fieldName:"Course__c","label":"Course Name"},
        {fieldName:"Amount_Charged__c","label":"Amount Charged"},
        {fieldName:"CourseMedium__c","label":"Course Mode"},
        {fieldName:"Extended_Months__c","label":"Extended Months"},
        
      ]
    @api recordId

    @wire(getRecordUi, { recordIds: '$recordId', layoutTypes: 'Full', modes: 'Edit' })
    invoiceRecordUiHandler({data,error}){
        if(data) {
            console.log(data)
            this.formFields= this.formFields.map(item=>{
                return{...item,value:data.records[this.recordId].fields[item.fieldName].value}
            })
        }
        if(error){
            console.error()
        }
    }
    
}









// import INVOICEID from '@salesforce/InvoiceDetails__c/Id'
// import INVOICE_NO from '@salesforce/schema/InvoiceDetails__c.InvoiceNo__c'
// import CREATED_DATE from '@salesforce/schema/InvoiceDetails__c.InvoiceCreatedDate__c'
// import DUE_DATE from '@salesforce/schema/InvoiceDetails__c.InvoiceDueDate__c'
// import ADD_1 from '@salesforce/schema/InvoiceDetails__c.Address1__c'
// import ADD_2 from '@salesforce/schema/InvoiceDetails__c.Address2__c'
// import COM_URL from '@salesforce/schema/InvoiceDetails__c.CompanyUrl__c'
// import COM_PH from '@salesforce/schema/InvoiceDetails__c.Company_Phone__c'
// import COM_NAME from '@salesforce/schema/InvoiceDetails__c.CompanyName__c'

// import CLIENTID from '@salesforce/Client_Details__c/Id'
// import CL_NAME from '@salesforce/schema/Client_Details__c.Client_Name__c'
// import CL_EMAIL from '@salesforce/schema/Client_Details__c.Client_Email__c'
// import CL_PH from '@salesforce/schema/Client_Details__c.Client_Phone__c'
// import CL_ADD from '@salesforce/schema/Client_Details__c.Client_Address__c'

// import SERVICEID from '@salesforce/Service__c/Id'
// import COURCE_NAME from '@salesforce/schema/Service__c.Course_Name__c'
// import COURCE_MODE from '@salesforce/schema/Service__c.Course_Mode__c'
// import EX_MONTHS from '@salesforce/schema/Service__c.Extended_Months__c'
// import AMOUNT from '@salesforce/schema/Service__c.Amount__c'