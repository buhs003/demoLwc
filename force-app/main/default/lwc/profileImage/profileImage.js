import { LightningElement, wire ,api} from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import uploadProfilePhoto from '@salesforce/apex/ProfilePhotoController.getProfilePhotoUrl';
import deleteProfilePhoto from '@salesforce/apex/ProfilePhotoController.uploadProfilePhoto';
import getProfilePhotoUrl from '@salesforce/apex/ProfilePhotoController.deleteProfilePhoto';
import uploadProfilePicture from '@salesforce/apex/ProfilePhotoController.uploadProfilePicture';
import PROFILE_PICTURE_FIELD from '@salesforce/schema/User.SmallPhotoUrl';
export default class ProfileImage extends LightningElement {

  @api recordId; // The record ID of the parent object
  profilePhotoUrl; // The URL of the current profile photo

  @wire(getRecord, { recordId: '$recordId', fields: [PROFILE_PICTURE_FIELD] })
  wiredRecord({ error, data }) {
    if (data) {
      this.profilePhotoUrl = data.fields.SmallPhotoUrl.value;
    } else if (error) {
      console.error(error);
    }
  }
  connectedCallback() {
    this.loadProfilePhotoUrl();
  }

  loadProfilePhotoUrl() {
    getProfilePhotoUrl({ parentId: this.recordId })
      .then(url => {
        this.profilePhotoUrl = url;
      })
      .catch(error => {
        console.error(error);
      });
  }

  handleUploadFinished(event) {
    const uploadedFiles = event.detail.files;
    if (uploadedFiles.length > 0) {
      const contentDocumentId = uploadedFiles[0].documentId;
      uploadProfilePhoto({ parentId: this.recordId, contentDocumentId })
        .then(url => {
          this.profilePhotoUrl = url;
          this.showToast('success', 'Profile Photo Uploaded', '');
        })
        .catch(error => {
          console.error(error);
          this.showToast('error', 'Profile Photo Upload Failed', error.body.message);
        });
    }
  }

  handleDelete() {
    deleteProfilePhoto({ parentId: this.recordId })
      .then(() => {
        this.profilePhotoUrl = null;
        this.showToast('success', 'Profile Photo Deleted', '');
      })
      .catch(error => {
        console.error(error);
        this.showToast('error', 'Profile Photo Deletion Failed', error.body.message);
      });
  }

  showToast(variant, title, message) {
    const event = new ShowToastEvent({
      variant,
      title,
      message,
    });
    this.dispatchEvent(event);
  }
  handleReplace(){



  }
}