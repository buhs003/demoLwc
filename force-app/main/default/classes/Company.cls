public class Company {
    public string companyName;
    public string ceo;
    public Integer employeeCount;
    public Long revenue;
    
    //list of all customers
      List<Client> Customers = new list<Client>();
    
    //add new customer
    public void addNewCustomer(string clientName,string website,string email,long phone){
        Client customer = new Client(clientName,website,email,phone);
        Customers.add(customer);
        
    }
    //print the list of all customers
    public void getAllCustomer(){
        for(Client Customer : Customers){
            system.debug('Customer Name:'+Customer.clientName+',Customer website:'+Customer.website+',Customer email:'+Customer.email+',Customer PhoneNo:'+Customer.phone);
        }
        
    }
    //private inner class to store the customer information 
    private class Client{
        public string clientName;
        public string website;
        public string email;
        public Long phone;
        
        client(string clientName,string website,string email,long phone){
            this.clientName = clientName;
            this.website = website;
            this.email = email;
            this.phone = phone;
        }
    }
}