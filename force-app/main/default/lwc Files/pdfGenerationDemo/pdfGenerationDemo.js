import { LightningElement,api } from 'lwc';
import generatePDF from '@salesforce/apex/pdfControllerApex.generatePDF'

export default class PdfGenerationDemo extends LightningElement {
    @api recordId
    imageUrl = 'https://www.google.com/images/logo.png'
    invoiceData={
        invoiceNo:'123',
        invoiceCreated:'January 1,2019',
        invoiceDue:'January 10,2020',
        companyName:'Sparksuite,Inc.',
        address1:'12345 Sunny Road',
        address2:'SunnyVilla ,CA 12343'
    }
    clientData={
        client:'Acme Corp',
        userName:'John Doe',
        email:'john@example.com'
    }
    // services or the amount the have used
    
    //services Array.and are rendered on Html and in pdf as well.
    services=[
        {name:'Consultant fee',amount:1000.00},
        {name:'Website desgin',amount:300.00},
        {name:'Hosting(3 months)',amount:75.00}
    ]
    get totalAmount(){
        return this.services.reduce((total,service)=>{
            return total = total+service.amount
        },0)
    }
    pdfHandler(){
        let content = this.template.querySelector('.container')
        console.log(content.outerHTML)
        generatePDF({recordId:this.recordId,htmlData:content.outerHTML}).then(result=>{
            console.log("attachment id",result)
            window.open(`https://pletra3120-dev-ed.file.force.com/servlet/servlet.FileDownload?file=${result.Id}`)
        }).catch(error=>{
            console.error(error)
        })
    }
}