public class Friends {
    /*Pizza Rates:
1 Slice -$8/Slice
2-3 Slice - $7/Slice
>3 Slice - $6/Slice
Ross ordered -3 Slice
Chandler ordered -1 Slice
Joey ordered -4 Slice*/
    //Create rate Card with Constantes
    Final Integer ONLY_ONE_SLICE =8;
    Final Integer UPTO_THREE_SLICE =7;    
    Final Integer MORE_THAN_THREE_SLICE =6;
    //this method accepts number of slices
    //and return the amount
    Public Integer getBill(Integer numberOfslices){
        Integer billAmount = (numberOfslices == 1 ? ONLY_ONE_SLICE*numberOfslices : numberOfslices <=3 ? UPTO_THREE_SLICE*numberOfslices :
                                                                                                       MORE_THAN_THREE_SLICE*numberOfslices);
        return billAmount;
    }
}