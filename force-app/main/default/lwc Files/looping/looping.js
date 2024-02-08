import { LightningElement } from 'lwc';

export default class Looping extends LightningElement {
    carList = ["Ford", "Audi", "Maruti", "Hyundai", "Mercedies"]

    //array of object
    ceoList = [
        {
            id: 1,
            comapny: "Google",
            name:"Sundar Pichai"
        },
        {
            id: 2,
            comapny: "Apple Inc",
            name:"Tim cook"
        },
        {
            id: 3,
            comapny: "FaceBook",
            name:"Mark Zuckerberg"
        },
        {
            id: 4,
            comapny: "Amazon.com",
            name:"jeff Bezos"
        },

    ]
}