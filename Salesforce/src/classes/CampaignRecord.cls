/*Write a SOQL Query on to retrieve/print 10 Campaign records and sort in ascending

as well as descending order.*/

public class CampaignRecord {
    
    public void Campaign()
    {
        list<Campaign> camp = new list<Campaign>();
        camp = [SELECT Id ,Name FROM Campaign ORDER BY Name ASC  LIMIT 10];
        for(Campaign c : camp)
        {
            system.debug(c);
        }
        camp = [SELECT Id ,Name FROM Campaign ORDER BY Name DESC  LIMIT 10];
        for(Campaign c : camp)
        {
            system.debug(c);
        }
    }

}