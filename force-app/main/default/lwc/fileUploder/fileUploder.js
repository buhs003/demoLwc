import { LightningElement,track } from 'lwc';

export default class FileUploder extends LightningElement {
    @track uploadedFiles=[];
    
    handleuplodeFinished(event){
        const uploadedFiles = event.detail.file;
        this.uploadedFiles = uploadedFiles;
    }
}