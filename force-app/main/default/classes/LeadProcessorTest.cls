@isTest
private class LeadProcessorTest {

    @testSetup
    static void setupData() {
        // Create test Lead records
        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testLeads.add(new Lead(
                FirstName = 'Test',
                LastName = 'Lead ' + i,
                Company = 'Test Company',
                Status = 'Open - Not Contacted'
            ));
        }
        insert testLeads; // Insert the test leads
    }

    @isTest
    static void testLeadProcessor() {
        // Execute the batch job
        Test.startTest();
        LeadProcessor leadProcessor = new LeadProcessor();
        Database.executeBatch(leadProcessor, 200); // Batch size of 200
        Test.stopTest();

        // Verify that all leads were updated correctly
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead];

        for (Lead updatedLead : updatedLeads) {
            System.assertEquals('Dreamforce', updatedLead.LeadSource, 'LeadSource should be updated to Dreamforce');
        }
    }
}