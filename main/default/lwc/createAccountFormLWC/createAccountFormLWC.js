import { LightningElement,track } from 'lwc';
import createAccount from '@salesforce/apex/createAccountFormHandler.createAccount'

export default class CreateAccountFormLWC extends LightningElement {

    @track accData = {};

    handleChange(event) {
        const field = event.target.name;
        const value = event.target.value;
        this.accData[field] = value;
    }

    createAccountRecord() {
        createAccount({ accObj: this.accData })
            .then(result => {
                console.log('Account created successfully');
                // Optional: show toast or reset fields
                alert('Account created successfully: ');
            })
            .catch(error => {
                console.error('Error creating account:', error);
                alert
            });
    }

}