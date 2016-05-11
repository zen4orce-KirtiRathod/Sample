public with sharing class CountryController {

    public string selectedcountry{get;set;}
    public string selectedcity{get;set;}

        
        
        public list<selectoption> getCountry()
        {
            list<selectOption> country = new list<selectOption>();
                for(Country__c c : Country__c.getAll().values())
                {
                    country.add(new selectoption(c.Name,c.Name));
                
                }
                return country;
        
        
        }
    public list<selectoption> getCity()
    {
        list<selectoption> city = new list<selectoption>() ;
        list<City__c> c =  City__c.getAll().values();
        for(City__c	t : c)
        {
        	if(this.selectedcountry == t.Country__c)
            {
                city.add(new selectoption(t.name,t.name));
            }

        
        }
        
        return city;
        
    }
    
    
    }