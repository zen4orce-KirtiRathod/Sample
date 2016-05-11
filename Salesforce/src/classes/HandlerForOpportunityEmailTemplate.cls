public  class HandlerForOpportunityEmailTemplate {
	
	public static void afterInsert(list<Opportunity> newMap)
	{
	 	
		Set<Id> ownerIds = new Set<Id>();
			
		for (Opportunity opp : newMap) 
		{
			ownerIds.add(opp.OwnerId);
  		}
  		 
  		List<User> users = [SELECT  ManagerId FROM User WHERE Id IN :ownerIds];
  		Map<Id, Id> userToMgr = new Map<Id, Id>();
  		for (User u : users) 
  		{
			userToMgr.put(u.Id, u.ManagerId);
 		}
 					
		List<EmailTemplate> emailTemplateList = [SELECT Id FROM EmailTemplate  WHERE DeveloperName  = 'OpportunityTemplate'];
		List<Messaging.Singleemailmessage> emailToSend = new List<Messaging.Singleemailmessage>();
		
		
		for(Opportunity opp : newMap)
		{
			if(opp.Amount > 25000)
			{
				system.debug('if stmt');
				Messaging.Emailattachment efa = new Messaging.Emailattachment();
				
				Messaging.SingleEmailmessage mail = new Messaging.SingleEmailmessage();
				
				mail.setTemplateId(emailTemplateList[0].Id);
				mail.setTargetObjectId(userToMgr.get(opp.OwnerId));
			    mail.setSenderDisplayName('Abbvie IT Team');
			    mail.setSaveAsActivity(false);
			 	emailToSend.add(mail);
			}
			
		}
		Messaging.SendEmailResult[] results = Messaging.sendEmail(emailToSend);
		
			
			
		}
		public static void afterUpdate(Map<Id,Opportunity>oldMap,list<Opportunity> newlist)
        {
			list<Opportunity> opp = new list<Opportunity>();
            Boolean flag = false;
            for(Opportunity o: newlist)
            {
                if(oldMap.get(o.id).Amount != o.Amount && o.Amount > 250000)
                {
                    opp.add(o);
                    flag= true;
                }
                
            }
            if(flag == true)
            {
                afterInsert(opp);
            }
            
            
            
            
        }
	}