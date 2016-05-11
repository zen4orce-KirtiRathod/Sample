public with sharing class OpportunityChatter {
    
    
    public static  void Opp(List<Opportunity> newlist)
    {
        list<FeedItem> f1 = new list<FeedItem>();
        String  userid =Userinfo.getUserId();
        
        //User userid = new User();
        for(Opportunity op : newlist)
        {
            if(op.StageName == 'Closed Won')
            {
             	FeedItem f = new FeedItem();
                f.ParentId ='00528000001F4bMAAS';
                f.Body = 'Opportunity is Closed by trigger Logged in User:'+ userid;
				f.Title	  = 'Closed Won';
               // f.LinkUrl = 'https://ap2.salesforce.com/_ui/core/chatter/ui/ChatterPage'+f.id;
                f1.add(f);
               
                //String name = userid.Name ;
                
            }
            
        }
        insert f1;

    }
    
    

}