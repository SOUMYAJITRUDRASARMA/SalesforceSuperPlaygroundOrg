/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestVerifyDate {

    @isTest
    static void CheckDates() {
        Date d1 = Date.newInstance(2024, 1, 1),
             d2 = Date.newInstance(2024, 1, 20),
             d3 = Date.newInstance(2024, 1, 31),
             d4 = Date.newInstance(2024, 3, 1);

        System.assertEquals(d2, VerifyDate.CheckDates(d1, d2));
        System.assertEquals(d3, VerifyDate.CheckDates(d2, d1));
        System.assertEquals(d3, VerifyDate.CheckDates(d1, d4));
    }
    
    // @isTest
    // static void DateWithin30DaysTest() {
    //     Date d1 = Date.newInstance(2024, 1, 1),
    //          d2 = Date.newInstance(2024, 1, 2),
    //          d3 = Date.newInstance(2024, 3, 1);

    //     System.assert(!VerifyDate.DateWithin30Days(d2, d1));
    //     System.assert( VerifyDate.DateWithin30Days(d1, d2));
    //     System.assert(!VerifyDate.DateWithin30Days(d1, d3));
    // }
    
    // @isTest
    // static void SetEndOfMonthDateTest() {
    //     Date dt = Date.newInstance(2024, 1, 31);
    //     System.assertEquals(dt, VerifyDate.SetEndOfMonthDate(dt));
    // }

}