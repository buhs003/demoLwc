import { LightningElement,track,wire } from 'lwc';
import getTasks from '@salesforce/apex/ToDoListController.getTasks';


export default class ToDo extends LightningElement {
   
    newTask = '';
    @track toDotask = [];

    @wire(getTasks)
    getTodoTasks(response){
        let data = response.data;
        let error = response.error;
        if(data){
            //console.log(JSON.stringify(data));
            data.forEach(task =>{
                this.toDotask.push({
                    id : this.toDotask.length + 1,
                    name : task.Subject,
                    recordId  : task.Id
                });
            });
           // console.log(JSON.stringify(this.toDotask));
        }
        else if(error){
            console.log('Error'+error);
        }

    }
    updateNewtask(event) {
        this.newTask = event.detail.value;
        // console.log(this.newTask);
    }
    addtasktolist() {
    // console.log(this.toDotask);
        this.toDotask.push({
            id: this.toDotask.length + 1,
            name: this.newTask
        });
       this.newTask = ''

    // this.toDotask.push({
    //     id: this.toDotask.data.length + 1,
    //     Subject: this.newTask
    // });
    //   this.newTask = ''

    }
    deleteTaskFromList(event){
       // console.log('Deleting Task');
       // console.log(event.target.name);

        let IdToDelete = event.target.name;
        let toDoTasks = this.toDotask;
        let toDoTaskIndexToDel;

        //Method 1
        // for(let i=0; i<toDoTasks.length; i++){
        //     if(IdToDelete === toDoTasks[i].id){
        //         toDoTaskIndexToDel = i;
        //     }
        // }
        // //toDoTasks.splice(toDoTaskIndexToDel, 1);
        // console.log(JSON.stringify(toDoTasks.splice(toDoTaskIndexToDel, 1)));

        //Method 2
        // toDoTasks.splice(
        //     toDoTasks.findIndex(function(todoTask){
        //         return toDoTasks.id === IdToDelete
        //     })
        //     ,1
        // );

        //Method 3
        toDoTasks.splice( toDoTasks.findIndex(todoTask => todoTask.id === IdToDelete),1);
        
    }
    
}