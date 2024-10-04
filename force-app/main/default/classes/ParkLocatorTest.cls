@isTest
public with sharing class ParkLocatorTest {
    @isTest
    public static void testResponse() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> result = ParkLocator.country('Germany');
        Assert.areEqual(result.size(), 2);
    }
}