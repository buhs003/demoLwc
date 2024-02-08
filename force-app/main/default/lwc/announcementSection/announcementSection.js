import { LightningElement ,wire} from 'lwc';
import getAnnouncements from '@salesforce/apex/AnnouncementsController.getAnnouncements';

export default class AnnouncementSection extends LightningElement {
  @wire(getAnnouncements)
  announcements;

  // Optional: add a refresh button to the component that re-fetches the announcements
  handleRefreshClick() {
    return refreshApex(this.announcements);
  }
}