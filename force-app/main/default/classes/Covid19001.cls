public class Covid19001 {
    private Integer recoveredInarea = 0;
    private static Integer recoveredIncountry = 0;
    
    //parameterized constructor to set class variables value
    public Covid19001(Integer recoveredInarea){
        this.recoveredInarea = recoveredInarea;
        recoveredInCountry += recoveredInarea;
    }
    public void treatPatient(){
        recoveredInarea++;
        recoveredInCountry++;
    }
    public Integer getTreated(){
        return recoveredInarea;
    }
    
}