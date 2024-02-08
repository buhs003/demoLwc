@isTest
public class Covid19001Test {
    @isTest
    public static void treatPatientTest(){
        //create the instance of the class
        Covid19001 jaipur = New Covid19001(10);
        
       
        //check if the count is 10 or not
        system.assertEquals(10, jaipur.getTreated(),'Treated Count Does Not Match');
    }
}