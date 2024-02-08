import { LightningElement,api,wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';
import getBatchStatus from '@salesforce/apex/BatchStatusController.getBatchStatus';

export default class BatchStatus extends LightningElement {
    @api jobId;
    @api redirectUrl;
    isRunning = true;
    isCompleted = false;
    status = '';

    @wire(getBatchStatus, { asyncJobId: '$jobId' })
    wiredBatchStatus(result) {
        if (result.data) {
            this.isRunning = false;
            this.isCompleted = true;
            this.status = result.data.Status;
        } else if (result.error) {
            console.log(result.error);
        }
    }

    redirectToUrl() {
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: this.redirectUrl
            }
        });
    }

    connectedCallback() {
        this.intervalId = setInterval(() => {
            refreshApex(this.wiredBatchStatus);
        }, 2000);
    }

    disconnectedCallback() {
        clearInterval(this.intervalId);
    }
}