public class Fitnesss {
    Public static decimal calculateBmi(decimal weight ,decimal height){
        decimal result = weight /(height* height);
            return result;
    }
    Public static decimal calculatePace(decimal Distance ,decimal minutes){
        decimal hr = minutes/60;
        decimal pace = Distance/hr;
        return pace;
    }
    
}