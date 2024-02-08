import { LightningElement } from 'lwc';

export default class LifeCycleChild extends LightningElement {
    //calling constructor method
    constructor() {
        //it gets called with the component loads
        super()
        //we cant query as the dom is not ready till now
        //we can jst use this.template at the component level by 
        //using listerners as this.template.addEventListner('mouseOver',fun)
        //this.template.querySelector('.abc')
        console.log("child Constructor Called")
    }
    //interval
    connectedCallback() {
        //used to fectch the data or apex service or listen for event such as publish subscribe from the server when the component loads.
        console.log("child connectedCallback Called")
        //window property runs till our browser runs
        //this is present and may cause a memory lick issue.
        // window.addEventListener('click', this.handleClick)
        // const interval = window.setInterval()
        throw new Error('Loading of child Component Failed')

    }
    renderedCallback() {
        console.log("child renderedCallback Called")
    }
    //it gets called when we remove the component from the dom
    //unmounting phase
    disconnectedCallback() {
        alert('Child DisconnectedcallBack called !!!')
        //when we remove the component it will also remove the listner and avoid a memory lick.
        // window.removeEventListener('click', this.handleClick)
        // interval.clearInterval(this.interval)

    }
}