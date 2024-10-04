@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        // Extract the Account ID from the URL
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substringBetween('/Accounts/', '/contacts');
        
        // Query for the Account and its related Contacts
        Account account = [
            SELECT Id, Name, (SELECT Id, Name FROM Contacts)
            FROM Account 
            WHERE Id = :accountId
            LIMIT 1
        ];

        return account;
    }
    
}