public with sharing class AccountProcessor {

    @future
    public static void countContacts(List<Id> accountIdList) {
        // Query all the accounts with their contacts
        List<Account> accountsToUpdate = new List<Account>();
        Set<Id> processedIds = new Set<Id>();

        // Query for the number of contacts related to each account
        for (AggregateResult ar : [
            SELECT AccountId, COUNT(Id) totalContacts
            FROM Contact
            WHERE AccountId IN :accountIdList
            GROUP BY AccountId
        ]) {
            // Create an account record to update
            Account acc = new Account(
                Id = (Id) ar.get('AccountId'),
                Number_Of_Contacts__c = (Integer)ar.get('totalContacts')
            );
            processedIds.add(acc.Id);
            accountsToUpdate.add(acc);
        }

        // Because if account has not contacts , since referencing from contacts , account woulld not be updated (stays null)
        for(Id id: accountIdList) if(!processedIds.contains(id)) accountsToUpdate.add(new Account(
            Id = id,
            Number_Of_Contacts__c = 0
        ));

        update accountsToUpdate;


        // List<Account> accountList = [
        //     SELECT Id, Contacts
        //     FROM Account
        //     WHERE Id IN :accountIdList
        // ];

        // for(Account account: accountList) account.Number_Of_Contacts__c = account.Contacts.size();

        // update accountList;
    }
}