public class JSON_Ex_2 {
    public Integer age 				{set;get;}
    public Account acc 				{set;get;}
    public WrapperJSON_EX_1 std		{set;get;}
    public WrapperJSON_EX_1 newStd2	{set;get;}
    public map<string,Object> resMap{set;get;}
    
    public JSON_Ex_2(){
        
        //JSON.deserialize() :This will return object.
        //we need to typeCast object in the form of corresponding object.
        //Type Cast Integer Class.
        //Classparameter = (DataType)JSON.deserilize('10',apexdatatype.class);
        age = (Integer)JSON.deserialize('10', Integer.class);
        string js1Acc = '{"Name":"Wipro","Industry":"Banking","Phone":"040-1234"}';
        //typeCast Account and pass the string.
        acc = (Account)JSON.deserialize(js1Acc, Account.class);
        string stdstr = '{"StdName":"Shubham","Stdphone":"7744820291","Place":"SRNagar"}';
        string stdstr2 = '{"StdName":"Shubham","Stdphone":"7744820291","StdCity":"SRNagar"}';
        
        //typeCast StudentForJSON Class as a Object.
        //the elements in the jason are their/not their in the class their is no issue
        std = (WrapperJSON_EX_1)JSON.deserialize(stdstr, WrapperJSON_EX_1.Class);
        system.debug(std);
        
        //every elements given in the json string should be their in the class 
        //newStd2 = (WrapperJSON_EX_1)JSON.deserializeStrict(stdstr, WrapperJSON_EX_1.Class);
        newStd2 = (WrapperJSON_EX_1)JSON.deserializeStrict(stdstr2, WrapperJSON_EX_1.class);
        //If I dont have a dataType or class i will jst 
        //pass my json string in the below method it 
        //works for the entire data The json string 
        //will give the entire data. 
        resMap = (map<string,Object>)JSON.deserializeUntyped(stdstr2);
        
        
    }
}