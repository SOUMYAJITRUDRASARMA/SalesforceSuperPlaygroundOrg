@isTest
private class AddPrimaryContactTest {
    @testSetup
    static void setupData() {
        // Create test Account records with different BillingStates
        List<Account> accountsNY = new List<Account>();
        List<Account> accountsCA = new List<Account>();
        
        for (Integer i = 0; i < 50; i++) {
            accountsNY.add(new Account(Name = 'Test Account NY ' + i, BillingState = 'NY'));
            accountsCA.add(new Account(Name = 'Test Account CA ' + i, BillingState = 'CA'));
        }
        
        // Insert the Accounts
        insert accountsNY;
        insert accountsCA;
    }

    @isTest
    static void testAddPrimaryContact() {
        // Create a Contact object to be used for insertion
        Contact testContact = new Contact(FirstName = 'John', LastName = 'Doe', Email = 'john.doe@example.com');
        
        // Create an instance of AddPrimaryContact with state CA
        AddPrimaryContact addContactJob = new AddPrimaryContact(testContact, 'CA');
        
        // Enqueue the job
        Test.startTest();
        System.enqueueJob(addContactJob);
        Test.stopTest();

        // Verify that the Contacts were inserted for the Accounts in CA
        List<Contact> insertedContacts = [SELECT Id, AccountId FROM Contact WHERE Email = 'john.doe@example.com'];
        
        // Assert that there are 50 contacts for accounts in CA
        System.assertEquals(50, insertedContacts.size(), '50 Contacts should be inserted for Accounts in CA');
        
        // Verify that each inserted contact is associated with an Account in CA
        for (Contact insertedContact : insertedContacts) {
            System.assertNotEquals(null, insertedContact.AccountId, 'Contact should be associated with an Account');
        }
    }
}