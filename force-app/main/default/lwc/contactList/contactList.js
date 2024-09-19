import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import { reduceErrors } from 'c/ldsUtils';

import CONTACT_OBJECT_FIRSTNAME from '@salesforce/schema/Contact.FirstName';
import CONTACT_OBJECT_LASTNAME from '@salesforce/schema/Contact.LastName';
import CONTACT_OBJECT_EMAIL from '@salesforce/schema/Contact.Email';

const COLUMNS = [
    { label: 'First Name', fieldName: CONTACT_OBJECT_FIRSTNAME.fieldApiName , type: 'text' },
    { label: 'Last Name', fieldName: CONTACT_OBJECT_LASTNAME.fieldApiName , type: 'text' },
    { label: 'Email', fieldName: CONTACT_OBJECT_EMAIL.fieldApiName , type: 'text' }
];

export default class ContactList extends LightningElement {
    columns = COLUMNS;
    contacts;
    error;

    @wire(getContacts)
    wiredContacts({ data, error }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }

    get errors() {
        return (this.error)? reduceErrors(this.accounts.error): [];
    }
}