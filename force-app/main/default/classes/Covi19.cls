public class Covi19 {
    //variable
    public Integer recoveredInArea = 0;
    public static Integer recoveredInCountry = 0;
    //parameterized constructor to set variables value
    public Covi19(Integer recoveredInArea){
         this.recoveredInArea = recoveredInArea;
        recoveredInCountry += recoveredInArea;
    }
    //Method
    public void treatPatient(){
        recoveredInArea++;
        recoveredInCountry++;
    }
    //Method
    public Integer getTreated(){
        return recoveredInArea;
    }
}