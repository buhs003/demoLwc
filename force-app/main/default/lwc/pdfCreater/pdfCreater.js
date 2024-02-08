import { LightningElement, api } from 'lwc';
import invoiceHandler from '@salesforce/apex/InvoiceController.invoiceHandler'
import generatePDF from '@salesforce/apex/PdfCreaterApexController.generatePDF'
export default class PdfCreater extends LightningElement {

    @api recordId
    imageUrl = 'https://www.google.com/images/logo.png'
    invoiceData
    
    
    renderedCallback() {
        invoiceHandler({recId:this.recordId}).then(result => {
            console.log(result)
            this.invoiceData = result
            console.log("this.invoiceData" + this.invoiceData)
        }).catch(error => {
            console.error(error)
        })
    }

    pdfHandler() {
        let content = this.template.querySelector('.container')
        console.log(content.outerHTML)
        generatePDF({ recordId: this.recordId, htmlData: content.outerHTML }).then(result => {
            console.log("attachment id", result)
            window.open(`https://pletra3120-dev-ed.file.force.com/servlet/servlet.FileDownload?file=${result.Id}`)
        }).catch(error => {
            console.error(error)
        })
    }
}