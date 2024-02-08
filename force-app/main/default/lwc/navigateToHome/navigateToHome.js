import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation'
//wrapping our component.
export default class NavigateToHome extends NavigationMixin(LightningElement) {
    //on Click of button 
    navigateToHome() {
        //To dispatch the navigation request,call the navigation service's
        //[NavigationMixin.Navigate](pageRefrence object,[replace])
        this[NavigationMixin.Navigate]({
            //both home page and chatter of type namedPage.
            type:'standard__namedPage',
            attributes:{
                pageName:'home'
            }
        })
    }

    navigateTochatterPage() {
        //To dispatch the navigation request,call the navigation service's
        //[NavigationMixin.Navigate](pageRefrence,[replace])
        this[NavigationMixin.Navigate]({
            type:'standard__namedPage',
            attributes:{
                pageName:'chatter'
            }
        })
    }
}