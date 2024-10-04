@isTest
public class AnimalLocatorTest {

    @isTest
    static void testGetAnimalNameById_Success() {
        // Set up mock for successful response
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        // Perform the test call to the method
        String animalName = AnimalLocator.getAnimalNameById(1);

        // Assert the expected result
        System.assertEquals('Lion', animalName);
    }

    @isTest
    static void testGetAnimalNameById_Failure() {
        // Set up mock for failure response
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        // Perform the test call with an invalid ID
        String animalName = AnimalLocator.getAnimalNameById(999);

        // Assert the result should be null in case of failure
        System.assertEquals(null, animalName);
    }
}