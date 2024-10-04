@isTest
public class AnimalLocatorMock implements HttpCalloutMock {

    // Implement the respond method to simulate the HTTP response
    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        
        // Simulate a successful response for ID 1
        if (req.getEndpoint().contains('/animals/1')) {
            res.setStatusCode(200);
            res.setBody('{"animal": {"id": 1, "name": "Lion"}}');
        } 
        // Simulate a failure for other IDs
        else {
            res.setStatusCode(404);
            res.setBody('{"error": "Animal not found"}');
        }
        
        return res;
    }
}