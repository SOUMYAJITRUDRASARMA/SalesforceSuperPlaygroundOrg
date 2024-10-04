@isTest
private class AccountProcessorTest {

    @testSetup
    static void setupData() {
        // Create test Account and Contact records
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 3; i++) {
            accounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert accounts;

        List<Contact> contacts = new List<Contact>();
        contacts.add(new Contact(FirstName = 'John', LastName = 'Doe', AccountId = accounts[0].Id));
        contacts.add(new Contact(FirstName = 'Jane', LastName = 'Smith', AccountId = accounts[0].Id));
        contacts.add(new Contact(FirstName = 'Jim', LastName = 'Beam', AccountId = accounts[1].Id));
        insert contacts;
    }

    @isTest
    static void testCountContacts() {
        // Query the accounts for IDs to pass to the future method
        List<Account> accounts = [SELECT Id FROM Account];

        // Call the future method with the account IDs
        Test.startTest();
        AccountProcessor.countContacts(new List<Id> {accounts[0].Id, accounts[1].Id, accounts[2].Id});
        Test.stopTest();

        // Query the accounts and check if the Number_Of_Contacts__c field was updated
        Account acc1 = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :accounts[0].Id];
        Account acc2 = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :accounts[1].Id];
        Account acc3 = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :accounts[2].Id];

        System.assertEquals(2, acc1.Number_Of_Contacts__c, 'Account 1 should have 2 contacts');
        System.assertEquals(1, acc2.Number_Of_Contacts__c, 'Account 2 should have 1 contact');
        System.assertEquals(0, acc3.Number_Of_Contacts__c, 'Account 3 should have 0 contacts');
    }
}