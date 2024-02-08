import { LightningElement } from 'lwc';
import hasViewAllData from '@salesforce/userPermission/ViewAllData'
//importing permission
import myCustomPermission from '@salesforce/customPermission/showDetails'
export default class CheckPermissionDemo extends LightningElement {
    //User is not having userpermission to objectapi ViewAllData as it disabled for that profile. 
    //and is disable by admin for user in that permission check profile.
    get hasViewAllDataAvailable(){
        return hasViewAllData
    }   
    //creating a custom permission
    //creating  permission set 'permissionDemo'
    //in permission set going to custom permissionset 
    //asginning it by newly created custom permission ie.permissionDemo
    //assigning custom permission to the permission set.
    //now thecustom permission is assigned to the admin.

    get hascustomPermission(){
        return myCustomPermission
    } 
}