public class PTAddNumToList {
    public static void Evenoddeveluation(){
        list<Integer> evenno =  new List<Integer>();
        list<Integer> oddno = new List<Integer>();
        for(Integer i=1;i<=100;i++){
            if(math.mod(i,2)==0){
                evenno.add(i);
            }
            else{
                oddno.add(i);
            }
        }
        system.debug('Even No'+evenno);
        system.debug('Oddno' +oddno);
    }
    
}