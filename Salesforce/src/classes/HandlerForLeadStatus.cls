public with sharing class HandlerForLeadStatus {
    
     public static void afterInsert(List<Lead> newlist)
     {
        list<Lead> leadList = new list<Lead>();
        Lead objOfUpdated = new Lead();
        list<Lead> newLead = new list<Lead>();
            for(Lead l : newlist)
            {
                system.debug('first line of for loop');
                if(l.Status != null && l.Status =='Open - Not Contacted')
                {
                        
                        leadList.add(l);
                        system.debug('IN lead Status');
                }
            
      		}
            
            for(Lead l : leadList)
            {
                   ObjOfUpdated = l.clone();
                   system.debug('In cloning data');
                   objOfUpdated.Status = 'Working - Contacted';
                   objOfUpdated.Phone = ' ';
                   objOfUpdated.Email = ' ';
                   newLead.add(objOfUpdated);
                
            }   
             insert newLead;
    }
    
    public static void afterUpdate(Map<Id,Lead> oldMap,list<Lead> newlist)
    {
        list <Lead>listOfUpdated = new list<Lead>();
        boolean flag = false;
       
        for(Lead l : newlist)
        {
            if(oldMap.get(l.id).Status != 'Open - Not Contacted' && l.Status == 'Open - Not Contacted')
            {
            
                system.debug('Open not contacted ');
                flag = true;
                listOfUpdated.add(l);
            
            }
        
        }
         
       afterInsert( listOfUpdated);
    
    
    }
}