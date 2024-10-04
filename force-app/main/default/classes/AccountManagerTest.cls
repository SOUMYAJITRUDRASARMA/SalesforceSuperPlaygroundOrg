@isTest
private class AccountManagerTest {

    @isTest
    static void testGetAccount() {
        // Create test data: an Account and related Contacts
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        Contact testContact1 = new Contact(FirstName = 'John', LastName = 'Doe', AccountId = testAccount.Id);
        Contact testContact2 = new Contact(FirstName = 'Jane', LastName = 'Smith', AccountId = testAccount.Id);
        insert new List<Contact>{testContact1, testContact2};

        // Set up the request URI as if it were a real request
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/Accounts/' + testAccount.Id + '/contacts';
        RestContext.request = req;

        // Execute the method and capture the result
        Account result = AccountManager.getAccount();

        // Verify that the account details are returned correctly
        System.assertEquals(testAccount.Id, result.Id);
        System.assertEquals(testAccount.Name, result.Name);
        
        // Verify that the correct number of contacts is returned
        System.assertEquals(2, result.Contacts.size());

        // Check the individual contacts
        System.assertEquals(testContact1.Id, result.Contacts[0].Id);
        System.assertEquals('John Doe', result.Contacts[0].Name);
        System.assertEquals(testContact2.Id, result.Contacts[1].Id);
        System.assertEquals('Jane Smith', result.Contacts[1].Name);
    }

    // @isTest
    // static void testGetAccount_NoContacts() {
    //     // Create test data: an Account with no Contacts
    //     Account testAccount = new Account(Name = 'Test Account Without Contacts');
    //     insert testAccount;

    //     // Set up the request URI
    //     RestRequest req = new RestRequest();
    //     req.requestURI = '/services/apexrest/Accounts/' + testAccount.Id + '/contacts';
    //     RestContext.request = req;

    //     // Execute the method and capture the result
    //     AccountManager.AccountWrapper result = AccountManager.getAccount();

    //     // Verify that the account details are returned correctly
    //     System.assertEquals(testAccount.Id, result.accountId);
    //     System.assertEquals('Test Account Without Contacts', result.accountName);

    //     // Verify that no contacts are returned
    //     System.assertEquals(0, result.contacts.size());
    // }
}