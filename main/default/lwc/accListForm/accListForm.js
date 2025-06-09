import { LightningElement } from 'lwc';
import getAccountList from '@salesforce/apex/createAccountFormHandler.getAccountList';
export default class AccListForm extends LightningElement {
    acclist = [];
    isAcclistPresent = false;

    connectedCallback() {
        this.isAcclistPresent = false;
    }

    DisplayAccount() {
        getAccountList()
            .then(result => {
                console.log('Account list:', JSON.stringify(result));
                this.acclist = result;
                this.isAcclistPresent = true;
            })
            .catch(error => {
                console.error('Error fetching account list', error);
            });
    }


}