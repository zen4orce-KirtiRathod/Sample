public class MapExample {
    
    public void mapExam()
    {
        Map<ID,Account> name = new Map<ID,Account>();
        
        //system.debug(name.get(1));
        for(Account a : name.values())
        {
            system.debug(a.name);
        }
        
        
      //  map<integer,String> name = new Map<Integer,String>();
        
    }

}