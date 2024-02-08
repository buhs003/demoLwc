import { LightningElement, track } from 'lwc';

export default class HelloWorld extends LightningElement {
   //data binding//
   fullName = "Zero to hero"
   title = "aura"

   changeHandler(event) {
      this.title = event.target.value
   }
   //@track data binding//
   @track address = {
      city: 'Mumbai',
      postCode: 3000,
      country: 'India'
   }
   trackHandler(event) {
      this.address.city = event.target.value

   }
   //GETTER EX
   users = ["Shubham", "Smith", "Johan"]
   num1 = 10
   num2 = 20

   get firstUser() {
      return this.users[0].toUpperCase()
   }
   get multiply() {
      return this.num1 * this.num2
   }
   
}