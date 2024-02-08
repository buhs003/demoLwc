import { LightningElement } from 'lwc';
import { loadScript } from "lightning/platformResourceLoader";
import PDFJSFILE from '@salesforce/resourceUrl/pdfJsfile';
import getContactList from '@salesforce/apex/VmsAccountClass_1.getContactList';

export default class GeneratePdf extends LightningElement {
    contactList = [];
    headers = this.createHeaders([
        "Id",
        "FirstName",
        "LastName"
    ]);
    renderedCallback() {
        Promise.all([loadScript(this, PDFJSFILE)]);
        
    }
    generatePdf() {
        const { PDFJSFILE } = window.PDFJSFILE;
        const doc = new PDFJSFILE({
            encryption: {
                userPassword: "user",
                ownerPassword: "owner",
                userPermission: ["print", "modify", "copy", "annot-forms"]
            }

        });
        doc.text("Hi i am Shubham", 20, 20);
        doc.table(30, 30, this.contactList, this.headers, { autosize: true });
        doc.save("demo.pdf");
    }
    generateData() {
        getContactList().then(result => {
            this.contactList = result;
            this.generatePdf();
        })
    }
    createHeaders(keys) {
        let result = [];
        for (let i = 0; i < keys.length; i += 1) {
            result.push({
                id: keys[i],
                name: keys[i],
                prompt: keys[i],
                width: 65,
                align: "center",
                padding: 0
            });

        }
        return result;
    }

}