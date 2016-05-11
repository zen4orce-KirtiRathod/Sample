public with sharing class HandlerForLead {
	
	public static void beforeinsert(List<Lead> newList)
	{
		list<String> AreaCode      = new list<String>();
	    list<AreaZone__c> AreaZone = new list<AreaZone__c>();
	    list<Lead> insertLead      = new list<Lead>();
	    
	    map<String,AreaZone__c> areacodedetails = new map<String,AreaZone__c>(); 
	   
	   
	    AreaZone = [SELECT AreaCode__c,timeZone__C,State_Province__c From AreaZone__c ];
	    
	    for (AreaZone__c ac: AreaZone)    
	        areacodedetails.put(ac.AreaCode__c,ac);
	        
	    for(Lead l : newList)	
	    {
	       if(l.Phone != null && (l.NumberofLocations__c == null || l.State_Province__c == null))
	       {    
	           String value = l.phone.substring(0,3);
	           if(l.NumberofLocations__c == null  && areacodedetails.get(value)!=null)
	           {
	           	l.NumberofLocations__c = areacodedetails.get(value).timeZone__C; 
	           }
	           if(l.State_Province__c == null && areacodedetails.get(value) != null)
	           {
	           l.State_Province__c = areacodedetails.get(value).State_Province__c;
	       	   }
	      }
	    }
	}
    public static void beforeUpdate(List<Lead> newList,Map<id,Lead> oldMap)
    {
    	 list<AreaZone__c> AreaZone = new list<AreaZone__c>();
    	 map<String,AreaZone__c> areacodedetails = new map<String,AreaZone__c>(); 
    	 AreaZone = [SELECT AreaCode__c,timeZone__C,State_Province__c From AreaZone__c ];
	    
	    for (AreaZone__c ac: AreaZone)    
	        areacodedetails.put(ac.AreaCode__c,ac);
    	
    	for(Lead l : newlist)
    	{
    		if(l.phone != null)
            {
            	if(oldMap.get(l.id).Phone != l.Phone && areacodedetails.get(l.Phone.substring(0,3))!= null )
    	    	{
    			l.State_Province__c = areacodedetails.get(l.Phone.substring(0,3)).State_Province__c;
    			l.NumberofLocations__c = areacodedetails.get(l.Phone.substring(0,3)).timeZone__C;
    	    	}
            }
    	}
    
    
    
    }
   
       
    
}