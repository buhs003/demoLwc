public class Fitness {
    /**Fitness Class with helpful methods
* to calculate human fitness
* */
    public decimal calculateBmi(decimal weight ,decimal height) {
        decimal result = weight/(height*height);
        return result;
        
    }
    
    public decimal calculatePace(decimal distance,decimal minutes){
        decimal hr = minutes/60;
        decimal resultPace =distance/hr;
        return resultPace;
    }
    
}