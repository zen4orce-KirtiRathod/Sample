public class LastModifiedRecord {
    list<Contact> con = new list<Contact>();
    //DATE dated = TODAY();
   Date dToday = System.Today();
	Datetime dt = datetime.newInstance(dToday.year(), dToday.month(),dToday.day());
    public void query()
    {
    	con = [SELECT Name from Contact Where  LastModifiedDate = Today];
        for(Contact c : con)
    	{
        	system.debug(c);
    	}
          
    }
    
    
    
}