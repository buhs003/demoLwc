public class Mycompany {
    public string companyName;
    public string ceo;
    public string companyEmail;
    public Long revenue;
    private class Employee{
        public string employeeName;
        public string email;
        public Integer employeeId;
        public Long phone;
        
        Employee(string employeeName,string email,Integer employeeId,Long phone){
            this.employeeName= employeeName;
            this.email= email;
            this.employeeId =employeeId;
            this.phone = phone;
        }
    }
    //List of all customers
    List<Employee> empDetails =New List<Employee>();
    //add new empoyee
    public void addNewempoyee(string employeeName,string email,Integer employeeId,Long phone){
        Employee addEmp = new Employee(employeeName,email,employeeId,phone);
        empDetails.add(addEmp);
    }
    //print the list of all coustomer
    public void getaAllEmpoyees(){
        for(Employee emp : empDetails){
            system.debug('Coustomer Name:   '+emp.employeeName+',Empoyee Email:  '+emp.email+',EmpoyeeId:   '+emp.employeeId+',Employee Phone:      '+emp.phone);
        }
    }
    
}