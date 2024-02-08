public class MYFizzbuzzProb {
    public static void printFizzBuzz(){
        Integer enterValue = 0;
        do{
            if((math.mod(enterValue,3)==0) && (Math.mod(enterValue,5)==0)){
                system.debug('FizzzBuzzzz');
            }else if(math.mod(enterValue,3)==0){
                system.debug('Fizzzzz');
            }else if(math.mod(enterValue,5)==0){
                system.debug('Buzzzzz');
            }else{
                system.debug(enterValue);  
            }
            enterValue++;
        }while(enterValue<=100);
    }
}