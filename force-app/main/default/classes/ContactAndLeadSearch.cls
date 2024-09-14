public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String matchingName) {
        return [
            FIND :matchingName
            IN Name FIELDS
            RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)
        ];
    }
}