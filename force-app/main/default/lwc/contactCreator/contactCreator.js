import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CONTACT_OBJECT from '@salesforce/schema/Contact';

import CONTACT_OBJECT_FIRSTNAME from '@salesforce/schema/Contact.FirstName';
import CONTACT_OBJECT_LASTNAME from '@salesforce/schema/Contact.LastName';
import CONTACT_OBJECT_EMAIL from '@salesforce/schema/Contact.Email';

export default class ContactCreator extends LightningElement {
    objectApi = CONTACT_OBJECT
    fields = [CONTACT_OBJECT_FIRSTNAME, CONTACT_OBJECT_LASTNAME, CONTACT_OBJECT_EMAIL]

    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: 'Success',
            message: 'Contact created successfully! Record ID: ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }
}