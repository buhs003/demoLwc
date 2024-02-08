import { LightningElement } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
export default class DeleteRecordDemo extends LightningElement {
    recordId
    changeHandler(event){
        //event will be further recived as event.target.value the id which we are working on.
       this.recordId = event.target.value
    }
    deleteHandler(){
        //passing the recordId to delete and getting the Async result as a promice displaying sucess/failuar as message.
        deleteRecord(this.recordId).then((result)=>{

            console.log('Deleted Sucessfully!!'+result)
        }).catch(error=>{
            console.error(error)
        })
    }
}