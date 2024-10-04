public with sharing class ParkLocator {
    
    public static List<String> country(String country) {
        List<String> parkNames = new List<String>();

        // Instantiate ParkService class (which was generated from WSDL)
        ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();

            // Call the web service method passing the country name
            List<String> response = parkService.byCountry(country);

            // Iterate through the park objects and extract park names
            for (String park : response) {
                parkNames.add(park);
            }
        
        return parkNames;
    }
}