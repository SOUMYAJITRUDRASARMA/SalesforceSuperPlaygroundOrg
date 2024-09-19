import { LightningElement, wire } from 'lwc';
import queryAccountsByRevenue from '@salesforce/apex/AccountListControllerLwc.queryAccountsByRevenue'

export default class AccountFinder extends LightningElement {
    // Initialize annualRevenue with a value of null
    annualRevenue = null
    accounts = []
    @wire(queryAccountsByRevenue, { annualRevenue: '$annualRevenue' })
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data; // Store the list of accounts
        } else if (error) {
            console.error('Error fetching accounts:', error);
        }
    }

    // Handle change in input field and store the value in annualRevenue
    handleChange(event) {
        this.annualRevenue = event.detail.value;
    }

    // Reset the annualRevenue to null when the button is clicked
    reset() {
        this.annualRevenue = null;
    }
}