import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation'
export default class NavigateToLWC extends NavigationMixin(LightningElement) {
    navigateToLwc() {
        //navigating toward the component
        var defination = {
            componentDef: 'c:navigationLwcTarget',
            attributes:{
                recordId:'133131313131331'
            }
        }
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                //converting object to string.
                //btoa is a method for string conversion.
                url: '/one/one.app#'+btoa(JSON.stringify(defination))
            }
        })
    }
}