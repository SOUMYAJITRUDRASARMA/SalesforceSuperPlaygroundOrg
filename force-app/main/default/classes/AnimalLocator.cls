public with sharing class AnimalLocator {

    public static String getAnimalNameById(Integer id) {
        // Create the endpoint URL using the passed ID
        String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals/' + id;

        // Initialize HTTP callout
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        // Send the request and receive the response
        HttpResponse response = http.send(request);

        // Check the response status and return the name
        if (response.getStatusCode() == 200) {
            // Parse the response body to JSON
            Map<String, Object> responseBody = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            return (String) ((Map<String, Object>) responseBody.get('animal')).get('name');
        } else {
            // Handle errors, return null if the response is not successful
            return null;
        }
    }
}
