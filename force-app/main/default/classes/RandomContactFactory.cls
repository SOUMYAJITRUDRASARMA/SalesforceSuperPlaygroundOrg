public with sharing class RandomContactFactory {
    
    // Public Static Method to generate a list of Contacts with unique first names
    public static List<Contact> generateRandomContacts(Integer numContacts, String lastName) {
        // List to store generated contacts
        List<Contact> contacts = new List<Contact>();
        
        // Loop to create the required number of contacts
        for (Integer i = 0; i < numContacts; i++) {
            // Create a new Contact with a unique first name and common last name
            Contact newContact = new Contact(
                FirstName = 'Test ' + i,   // Unique First Name: Test 0, Test 1, etc.
                LastName = lastName        // Common Last Name
            );
            
            // Add the new Contact to the list
            contacts.add(newContact);
        }
        
        // Return the list of generated contacts
        return contacts;
    }
}
