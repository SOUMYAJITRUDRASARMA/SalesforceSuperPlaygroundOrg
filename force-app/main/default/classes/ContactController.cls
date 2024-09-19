public with sharing class ContactController {
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContacts() {
        // testing ...
        throw new AuraHandledException('Forced error');

        // return [
        //     SELECT Firstname, LastName, Email
        //     FROM Contact
        //     WITH SECURITY_ENFORCED
        // ];
    }
}