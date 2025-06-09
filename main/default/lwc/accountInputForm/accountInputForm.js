import { LightningElement,track } from 'lwc';
import createAccount from '@salesforce/apex/createAccountFormHandler.createAccount'
export default class AccountInputForm extends LightningElement {

   @track accData={
        Name:'',
         Phone:'',
          Business_Email__c:''
           
  };
  handlerChange(event){
      const field = event.target.name;  
      const value = event.target.value;
      this.accData[field] = value;
  }
 
createAccountRecord(){
    createAccount({accObj:this.accData})
    .then(
        result => {
    console.log('Account created successfully:', result);
    // Optional: show toast or reset fields
    alert('Account created successfully: ' + result);
})

}
}