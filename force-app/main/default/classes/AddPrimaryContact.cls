public class AddPrimaryContact implements Queueable {
    private Contact contactToInsert;
    private String stateAbbreviation;

    // Constructor that accepts a Contact and a state abbreviation
    public AddPrimaryContact(Contact contact, String state) {
        this.contactToInsert = contact;
        this.stateAbbreviation = state;
    }

    // Execute method to perform the actual processing
    public void execute(QueueableContext context) {
        // Query for Accounts in the specified state
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :stateAbbreviation LIMIT 200];

        List<Contact> contactsToInsert = new List<Contact>();
        
        // Insert a cloned contact for each account
        for (Account acc : accounts) {
            Contact clonedContact = contactToInsert.clone(); // Clone the contact
            clonedContact.AccountId = acc.Id; // Associate it with the Account
            contactsToInsert.add(clonedContact);
        }


        insert contactsToInsert; // Perform DML operation
    }
}