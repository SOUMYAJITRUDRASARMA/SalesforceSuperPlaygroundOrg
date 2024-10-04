global class LeadProcessor implements Database.Batchable<SObject> {
    
    // Start method that collects all Lead records
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id FROM Lead');
    }

    // Execute method that updates the Lead records
    global void execute(Database.BatchableContext bc, List<SObject> scope) {
        List<Lead> leadsToUpdate = new List<Lead>();

        for (SObject s : scope) {
            Lead lead = (Lead) s;
            lead.LeadSource = 'Dreamforce'; // Set the LeadSource to Dreamforce
            leadsToUpdate.add(lead);
        }

        update leadsToUpdate; // Update all leads in the batch
    }

    // Finish method (optional)
    global void finish(Database.BatchableContext bc) {
        // Optional: Perform any final operations after all batches are processed
    }
}
