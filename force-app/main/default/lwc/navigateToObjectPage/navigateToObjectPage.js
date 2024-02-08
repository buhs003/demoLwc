import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation'
//passing default field value.
//it provides 2 functions ie.encodeDefaultFieldValues/decodeDefaultFieldValues into a string
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils'
export default class NavigateToObjectPage extends NavigationMixin(LightningElement) {
    //on Click of button 
    navigateToNewRecord() {
        //To dispatch the navigation request,call the navigation service's
        //[NavigationMixin.Navigate](pageRefrence,[replace])
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            }

        })
    }
    navigateToNewRecordWithDefault() {
        const defaultValue = encodeDefaultFieldValues({
            FirstName: 'Zero',
            LastName: 'Hero',
            LeadSource: 'Other'
        })
        //To dispatch the navigation request,call the navigation service's
        //[NavigationMixin.Navigate](pageRefrence,[replace])
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            },
            //Data is usually called as state
            state: {
                //property
                defaultFieldValues: defaultValue
            }

        })

    }
    navigateToListView(){
        //To dispatch the navigation request,call the navigation service's
        //[NavigationMixin.Navigate](pageRefrence,[replace])
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'list'
            },
            state:{
                filterName:'Recent'
            }

        })

    }
    navigateToFiles(){
        //To dispatch the navigation request,call the navigation service's
        //[NavigationMixin.Navigate](pageRefrence,[replace])
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'ContentDocument',
                actionName: 'home'
            }

        })

    }
}