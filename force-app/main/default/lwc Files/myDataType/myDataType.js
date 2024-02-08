import { LightningElement } from 'lwc';

export default class MyDataType extends LightningElement {
    
    constructor(name, age) {
    this.name = name;
    this.age = age;
  }
}