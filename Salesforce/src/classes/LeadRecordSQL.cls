public class LeadRecordSQL {
    
   public void query()
   {
       
       //Select l.Status, l.LastName, l.Company From Lead l
       Lead l = new Lead(LastName = 'rathod',Company='salsecloud',Status = 'Closed-Converted');
       insert l;
       list<Lead> ld = new list<lead>([SELECT ID FROM LEAD]);
       for(Lead listed : ld)
       {
           system.debug(listed.LastName);
       }
       
   }

}