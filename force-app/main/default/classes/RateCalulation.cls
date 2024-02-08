public class RateCalulation {
    //variable
    final integer only_one_slice = 8;
    final integer upto_three_slice= 7;
    final integer More_Than_three_slice= 6;
    
    //Method
    public integer getBill(Integer numberOfSlices){
        Integer billAmount = numberOfSlices == 1 ? only_one_slice*numberofSlices 
            :(numberofSlices<=3 ? upto_three_slice*numberofSlices 
              : More_Than_three_slice*numberofSlices);
                  return billAmount;
    }
}