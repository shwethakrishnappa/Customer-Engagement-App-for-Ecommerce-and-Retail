import { LightningElement,api,track } from 'lwc';

import getPurchaseList from '@salesforce/apex/CustomerInteractionTracking.getPurchaseList';
import getEngList from '@salesforce/apex/CustomerInteractionTracking.getEngList';
import getLoyaltyList from '@salesforce/apex/CustomerInteractionTracking.getLoyaltyList';
export default class RecentPurchase extends LightningElement {
    @api recordId;
    @track purList = [];
    @track engList=[];
    @track loyaltyList=[];
    isPurchlistPresent = false;
    isEnglistPresent = false;
    isLoyaltylistPresent = false;

    // Optional: Can log recordId but don’t call Apex here unless recordId is guaranteed
    connectedCallback() {
        console.log('Record ID is:', this.recordId);
    }

    getPurchaseEvent() {
        console.log('Calling Apex with recordId:', this.recordId);

        if (!this.recordId) {
            console.warn('recordId is not available');
            return;
        }

        getPurchaseList({ accid: this.recordId })
            .then(result => {
                console.log('Result is:', result);
                this.purList = result;
                this.isPurchlistPresent = result && result.length > 0;
            })
            .catch(error => {
                console.error('Error fetching purchases:', error);
                this.purList = [];
                this.isPurchlistPresent = false;
            });
   
    }

    getEngmentEvent(){
        
        getEngList({ accid: this.recordId }).then(result => {
            console.log('Result is:', result);
            this.engList = result;
            this.isEnglistPresent = result && result.length > 0;
        })
        .catch(error => {
            console.error('Error Engment Activity:', error);
            this.engList = [];
            this.isEnglistPresent = false;
        });

    }

    getLoyaltyEvent(){
        getLoyaltyList({ accid: this.recordId })
        .then(result => {
            console.log('Result is:', result);
            this.loyaltyList = result;
            this.isLoyaltylistPresent = result && result.length > 0;
        
    }) .catch(error => {
        console.error('Error Loyalty Points:', error);
        this.engList = [];
        this.isEnglistPresent = false;
    });

    }




}