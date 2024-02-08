//wrapper class
//used to wrap the values with another field name and match with salesforce field name.

public class WrapperJSON_EX_1 {
    public string Stdname {set;get;} 
    public string Stdcity {set;get;}
    public string Stdphone {set;get;}
    public WrapperJSON_EX_1(string name,string city,string phone){
        this.Stdname = name;
        this.Stdcity = city;
        this.Stdphone = phone;
    }
    public WrapperJSON_EX_1(){
        
    }
}