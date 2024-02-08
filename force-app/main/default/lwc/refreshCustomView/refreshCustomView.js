import { LightningElement ,api} from 'lwc';
import getAccountRating from '@salesforce/apex/refreshController.getAccountRating'
export default class RefreshCustomView extends LightningElement {


ratingValue
@api recordId

connectedCallback(){
    this.fetchRating()
}
fetchRating(){
    getAccountRating({"accountId " :this.recordId})
    .then(response=>{
        this.ratingValue = response[0].Rating
        console.log(response);
    }).catch(error=>{
        console.error(error);
    })
}
}
