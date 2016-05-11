public class TranslationController {

    public string lang{get;set;}
    public string selectedlang{get;set;}
    
    public TranslationController(ApexPages.StandardController controller) {
        
        System.debug(selectedlang);
         
                
    }

    
    
    public list<selectoption> getValue()
    {
        list<selectoption> value = new list<selectoption>();
               
                value.add(new selectoption('en_US','English'));
        		value.add(new selectoption('es','spanish'));
                value.add(new selectoption('fr','French'));
        
           return value;
        
    }
    public void hello()
    {
        system.debug(selectedlang);
        if(selectedlang == 'en_US')
        {
            lang = 'en_US';
            system.debug('their');
        }
       else if(selectedlang == 'fr')
        {
           system.debug('here');
            lang = 'fr';
        }
        else
        {
            lang = 'es';
        }
    }
    

}