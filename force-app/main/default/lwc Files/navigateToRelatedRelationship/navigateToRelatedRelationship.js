import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
//Wrapping around lightningElement
export default class NavigateToRelatedRelationship extends NavigationMixin(LightningElement) {
    relatedList(){
        this[NavigationMixin.Navigate]({
            type:'standard__recordRelationshipPage',
            attributes:{
                recordId:'0015i00000TdLxvAAF',
                objectApiName:'Account',
                relationshipApiName:'Contacts',
                actionName:'view'
            }
        })
    }
}