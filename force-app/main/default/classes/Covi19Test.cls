@isTest
public class Covi19Test {
    @isTest
    public static void PatientTest(){
        //test for recovered in area variable in gettreated method.
        //create instance
        Covi19 jaipur = new Covi19(10);
        //check if the count is 10 or not
        integer treated = jaipur.getTreated(); 
        system.assertEquals(10, treated , 'Treated count doesent match');
        system.assertEquals(10, Covi19.recoveredInCountry, 'Treated count doesent match');

        //test for recovered in country static variable 
        Covi19 hyd = new Covi19(112);
        //check if the count is 112 or not
        treated = hyd.getTreated(); 
        system.assertEquals(112, treated , 'Treated count doesent match');
        //check the recovered in country count 122
        //system.assertEquals(122, Covi19.recoveredInCountry, 'Treated count doesent match');
        
        //test for getTreated method
        hyd.treatPatient();
        treated = hyd.getTreated();
        //check the incremented count
        //Area Wise
        system.assert(treated == 113, 'Treated count doesent match');
        system.assert(Covi19.recoveredInCountry == 123, 'Treated count doesent match');
        
    }
}