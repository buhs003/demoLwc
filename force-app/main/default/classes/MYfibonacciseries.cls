public class MYfibonacciseries {
    public static void printfibonacciseries(){
        integer current;
        integer previous = 1;
        integer beforeprevious = 0;
        system.debug(beforeprevious);
        system.debug(previous);
        integer i = 0;
        while(i<=18){
            current = previous + beforeprevious;
            system.debug(current);
            beforeprevious = previous;
            previous = current;
            i++;
        }
    }
}