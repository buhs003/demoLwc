public class BMICalculation {
    public static decimal calculateBMI(decimal weight,decimal height){
        if(height <= 0 || weight < 0){
            return -1;
        }
        decimal result = (weight/(height*height));
        return result;
    }
    public static decimal calculatePace(decimal distance,decimal minutes){
        if(distance < 0 || minutes <= 0){
            return -1;
        }
        decimal hr = minutes/60;
        decimal pace = distance/hr;
        return pace;
    }

}