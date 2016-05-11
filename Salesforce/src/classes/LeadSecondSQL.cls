public class LeadSecondSQL {
    
    public void query()
    {
        list<Lead> ld = new list<Lead>();
        ld =  [SELECT Id,Status FROM LEAD WHERE status = 'Closed-Won'];
        for(Lead l : ld)
        {
            l.status = 'Open - Not Contacted';
        }
        
    }

}