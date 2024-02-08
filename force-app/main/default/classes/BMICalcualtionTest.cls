@isTest
public class BMICalcualtionTest {
    @isTest
    public static void calculateBMITest1(){
        decimal weight = 60;
        decimal height = 1.2;
        decimal result = BMICalculation.calculateBMI(weight,height);
        //Decimal Class Method setscale method.
        result = result.setScale(2);
        system.assertEquals(41.67, result, 'BMI Should be 41.67 for 60Kg weight and 1.2M height');
    }
    @isTest
    public static void calculateBMITest2(){
        decimal weight = 0;
        decimal height = 1.2;
        decimal result = BMICalculation.calculateBMI(weight,height);
        system.assertEquals(0, result, 'BMI Should be 0 for 0Kg weight and 1.2M height');
    }
    @isTest
    public static void calculateBMITest3(){
        decimal weight = 60;
        decimal height = 0;
        decimal result = BMICalculation.calculateBMI(weight,height);
        system.assertEquals(-1, result, 'Invalid Input');
    }
    @isTest
    public static void calculateBMITest4(){
        decimal weight = -60;
        decimal height = 1.2;
        decimal result = BMICalculation.calculateBMI(weight,height);
        system.assertEquals(-1, result, 'Invalid Input');
        
    }
    @isTest
    public static void calculateBMITest5(){
        decimal weight = 60;
        decimal height = -1.2;
        decimal result = BMICalculation.calculateBMI(weight,height);
        system.assertEquals(-1, result, 'Invalid Input');
    }
    @isTest
    public static void calculatePaceTest1(){
        decimal distance = 10;
        decimal minutes = 60;
        decimal result = BMICalculation.calculatePace(distance, minutes);
        system.assertEquals(10, result, 'Pace should be 10Km/hr for 10Km in 60 minutes');
    }
    @isTest
    public static void calculatePaceTest2(){
        decimal distance = 10;
        decimal minutes = 0;
        decimal result = BMICalculation.calculatePace(distance, minutes);
        system.assertEquals(-1, result, 'Invalid Input');
    }
    @isTest
    public static void calculatePaceTest3(){
        decimal distance = 0;
        decimal minutes = 60;
        decimal result = BMICalculation.calculatePace(distance, minutes);
        system.assertEquals(0, result, 'Pace should be 0Km/hr for 0Km in 60 minutes');
    }
    @isTest
    public static void calculatePaceTest4(){
        decimal distance = -10;
        decimal minutes = 60;
        decimal result = BMICalculation.calculatePace(distance, minutes);
        system.assertEquals(-1, result, 'Invaild Input');
    }
    @isTest
    public static void calculatePaceTest5(){
        decimal distance = 10;
        decimal minutes = -60;
        decimal result = BMICalculation.calculatePace(distance, minutes);
        system.assertEquals(-1, result, 'Invaild Input');
    }
}