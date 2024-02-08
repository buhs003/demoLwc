public class MYleapyear {
    public static void getleapYear(Integer year){
        if(math.mod(year,4)==0){
            if(math.mod(year,100)==0){
                if(math.mod(year,400)==0){
                    system.debug('Its a leap year'+year);
                }else{
                    system.debug('Its Not a leap year'+year);
                }
                
            }else{
                system.debug('Its a leap Year'+year);
            }
            
        }else{
            system.debug('Its Not a Leap year'+year);
        }
    }
}