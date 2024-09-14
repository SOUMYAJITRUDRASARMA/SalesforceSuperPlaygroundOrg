public with sharing class AccountHandler {
    public static Account insertNewAccount(String accountName) {
        try {
            Account account = new Account(Name = accountName);
            insert account;
            return account;
        } catch(Exception e) {
            return null;
        }
    }
}