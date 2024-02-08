import { LightningElement } from 'lwc';

export default class LifeCycleParent extends LightningElement {
    //name
    //calling constructor method
    ischildVisible = false
    constructor(){
        //it gets called with the component loads
        super()
        //we cant query as the dom is not ready till now
        //we can jst use this.template at the component level by 
        //using listerners as this.template.addEventListner('mouseOver',fun)
        //this.template.querySelector('.abc')
        console.log("parent Constructor Called")
    }
    //connectedCallBack function invokes/fires 
    //automatically when certain lwc component inserted into web dom
    connectedCallback(){
        //used to fectch the data or apex service or listen for event such as publish subscribe from the server when the component loads.
        console.log("parent connectedCallback Called")
    }
    //Use it to perform logic after a component has
    // finished the rendering phase. This hook flows from child to parent.
    renderedCallback(){
        console.log("parent renderedCallback Called")
    
    }
    // changeHandler(event){
    //     this.name = event.target.value
    // }
    handleClick(){
        this.ischildVisible = !this.ischildVisible
    }

    errorCallback(error,stack){
        console.log(error.message)
        console.log(stack)
    }
    
}