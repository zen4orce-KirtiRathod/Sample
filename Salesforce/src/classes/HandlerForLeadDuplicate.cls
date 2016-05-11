public with sharing class HandlerForLeadDuplicate {
	
	public static void beforeInsert(list<Lead> newList,list<Lead> oldList)
	{
		Map<String,Lead> leadMap = new Map<String,Lead>();
		Map<String,String> phoneNumberList = new Map<String,String>();
      	for(Lead l :[SELECT id,Email,Phone FROM Lead WHERE Phone  != NULL AND Email != NULL ] )
		{
			phoneNumberList.put(l.Email,l.Phone);
		
		}
		for(lead l: newList)
         	{
         		
                if(l.Phone != null && phoneNumberList.get(l.Email) != null &&l.Email != null)
         		{
         			l.Email.AddError('Record already Exist');
          
                    
         		}
                phoneNumberList.put(l.Email,l.Phone);
         		
      		}   
		
	
	
	}
	
	public static void beforeUpdate(list<Lead> newList,Map<Id,Lead> oldMap)
	{
		Boolean flag = false;
		list<Lead> oldList = new list<Lead>([SELECT id,Email,Phone FROM Lead Where Phone  != NULL AND Email != null]);
		Map<String,String> phoneNumberList = new Map<String,String>();
	
		for(Lead l :oldList)
		{
			phoneNumberList.put(l.Email,l.Phone);
		
		}
		 
		for(Lead l : newList)
             {
             	if((l.Email == oldMap.get(l.Id).Email) && l.Phone == oldMap.get(l.Id).Phone ||(l.Phone == null ||l.Email == null))
             
             	{
             	   
             		flag= true;
             	
             	}
             
             }
         if(flag == false)
         {
         	for(lead l: newList)
         	{
         		if(phoneNumberList.get(l.Email) == l.Phone)
         		{
         			l.Email.AddError('Record already Exist');
         		}
         		
         	}
          
         
         }    
	
	}	
	
	public static void afterInsert(list<Lead> newlist){
		
		List<Task> tlist = new List<Task>();
		//t.OwnerId = userId;
        
        system.debug('in the task creation');
        
        for(Lead l: newlist)
        {
        	Task t = new Task();
        	t.Subject = 'Please make phone call within 24 hours';
        	t.OwnerId = l.OwnerId;
        	t.whoId = l.Id;
        	system.debug(t.OwnerId);
        	
        	tlist.add(t);
		
        }
       if(tlist.size()> 0)
        {
        	insert tlist;
        }
	}
}