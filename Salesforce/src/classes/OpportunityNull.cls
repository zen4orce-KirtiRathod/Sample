/*2. Query on all Opportunity records where its Account != NULL and Status = Closed

a. Add all Opportunity Id’s to the List and print the result

b. Add all Account Id’s to the set and print the result

c. Prepare the Map having Key as OpportunityId and Value as AccountId*/

public class OpportunityNull {

    public void Query()
    {
        list<Opportunity> op = new list<Opportunity>();
        set<Opportunity> setOpp = new set<Opportunity>();
        //Map<Id,Account> acc = new Map<Id,Account>([SELECT id ,AccountId from Opportunity WHERE AccountId != NULL]);
      
        //Select o.StageName, o.Id, o.AccountId From Opportunity o
        op = [SELECT Id,StageName,AccountId FROM Opportunity where AccountId != NULL AND (StageName = 'Closed Won' OR StageName ='Closed Lost')];
        for(Opportunity oppo : op)
        {
            system.debug(oppo.Id);
        }
        for(Opportunity oppo: op)
        {
            setOpp.add(oppo);
        }
        for(Opportunity oppo:setOpp)
        {
            system.debug(oppo.AccountId);
        }
        //system.debug(acc);
        
    }

}