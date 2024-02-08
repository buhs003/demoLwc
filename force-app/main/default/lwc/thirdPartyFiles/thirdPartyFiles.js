import { LightningElement } from 'lwc';
import MOMENT from '@salesforce/resourceUrl/moment'
import ANIMATE from '@salesforce/resourceUrl/animate'
//used to load the file.
import { loadScript, loadStyle } from 'lightning/platformResourceLoader'
export default class ThirdPartyFiles extends LightningElement {

    currentDate = ''
    isLibLoaded = false
    //when loadScript gets loaded we can perform some action
    //renderedCallback gets called again and again
    //stops renderedCallback render again and again.
    renderedCallback() {
        if (this.isLibLoaded) {
            return
        } else {
            Promise.all([
                // loadScript(refrence,zip+fileUrl).promice
                //loading javaScript third party laibraryies
                loadScript(this, MOMENT + '/moment/moment.min.js'),
                loadStyle(this, ANIMATE + '/animate/animate.min.css')
            ]).then(() =>{
                //loaded sucess
                this.setDateOnScreen()
             }).catch(error => {
                console.error(error)
            })
            //waits for completion all async operation inside the promice
            //labiary load on progress
            //promice.all is used to load more than one script.
            // loadScript(refrence,zip+fileUrl).promice
            //loading javaScript third party laibary
            //sucess
            this.isLibLoaded = true
        }

    }

    setDateOnScreen() {
        this.currentDate = moment().format('LLLL')
    }
}