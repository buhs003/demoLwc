import { LightningElement } from 'lwc';
import USER_IMAGE from '@salesforce/resourceUrl/user_image'
import USER_IMAGE2 from '@salesforce/resourceUrl/fly_birds'
export default class StaticImages extends LightningElement {
    UserImage  = USER_IMAGE
    FlyBird = USER_IMAGE2
}