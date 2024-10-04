@isTest
public class ParkServiceMock implements WebServiceMock {
    
    // Implement WebServiceMock's doInvoke method to mock the response
    public void doInvoke(
        Object stub, 
        Object request, 
        Map<String, Object> response, 
        String endpoint, 
        String soapAction, 
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    ) {
        
        // Mock response for parks in a specific country (e.g., "Germany")
        ParkService.byCountryResponse parkResponse = new ParkService.byCountryResponse();
        List<String> parks = new List<String>();

        // Adding dummy parks
        parks.add('Berlin National Park');
        parks.add('Black Forest Park');

        parkResponse.return_x = parks;
            
        response.put('response_x', parkResponse);
    }
}