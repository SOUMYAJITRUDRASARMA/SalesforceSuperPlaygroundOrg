@isTest
private class DailyLeadProcessorTest {
    @testSetup
    static void setupData() {
        // Create and insert 200 Lead records with blank LeadSource
        List<Lead> leads = new List<Lead>();
        
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(FirstName = 'Test', LastName = 'Lead ' + i, Company = 'Test Company', LeadSource = null));
        }
        
        // Insert the Leads
        insert leads;
    }

    @isTest
    static void testDailyLeadProcessor() {
        // Schedule the DailyLeadProcessor to run immediately
        String jobName = 'DailyLeadProcessorTestJob';
        DailyLeadProcessor leadProcessorJob = new DailyLeadProcessor();
        
        // Execute the job immediately for testing
        Test.startTest();
        String jobId = System.schedule(jobName, '0 0 * * * ?', leadProcessorJob);  // runs after test stop ...
        Test.stopTest();
        
        // Verify that all Leads were updated with the LeadSource 'Dreamforce'
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead];
        
        // Assert that all leads have the LeadSource set to 'Dreamforce'
        for (Lead updatedLead : updatedLeads) {
            System.assertEquals('Dreamforce', updatedLead.LeadSource, 'LeadSource should be updated to Dreamforce');
        }
    }
}