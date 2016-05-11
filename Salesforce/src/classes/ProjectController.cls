public class ProjectController {

    private final Project1__c prj;
    public Date startDate ;
    public Date lastDate;
    public list<Project1__c> Project= new list<Project1__c>();
    public list<WrapperTime>  wrapperTimeList{get;set;} 
    public list<Time_Entry__c> timeEntryList{get;set;}
    public Invoice_Line_Item__c invLine ;
   	list<Time_Entry__c> timee = new list<Time_Entry__c>();
    list<Invoice1__c> SeletedInvoice = new list<Invoice1__c>();
    public list<Invoice_Line_Item__c> invoiceLineItem = new list<Invoice_Line_Item__c>(); 
    public list<Invoice_Line_Item__c> allInvoiceLineItem = new list<Invoice_Line_Item__c>();
    public ProjectController(ApexPages.StandardController controller) 
     {
        
                this.prj = (Project1__c)controller.getRecord();
         		System.debug(prj);
                startDate = System.Date.today().toStartOfMonth();
                lastDate = startDate.addMonths(1).addDays(-1);
                this.prj.Start_Date__c = startDate;
                this.prj.End_Date__c= lastDate;
                
         		
     }
    
    public PageReference Search()
    {
        wrapperTimeList  = new list<WrapperTime>();
        list<Project1__c> pr = new list<Project1__c>([SELECT id,Name,Start_Date__c,End_Date__c,Account_Name__c,Total_Project_Hrs__c,Total_Invoice_Hours__c FROM Project1__c WHERE id =: prj.id]); 
        System.debug(project); 
        timeEntryList = new list<Time_Entry__c>([SELECT id,Name,
                                                       Billable_Amount__c,
                                                       Date__c,Description__c,
                                                       Duration__c,Invoiced__c,
                                                       Project__c,
                                                       Time_Entry__c,
                                                       Time_Entry_Hours__c 
                                                       FROM Time_Entry__c 
                                                       where Project__c =: prj.Id]);
  
         for( Time_Entry__c te : timeEntryList)
         {
             
             {
               
                wrapperTimeList.add(new WrapperTime(te));
             }
             
         }
        
        return null;
        
    }
    public list<WrapperTime> getwrapperProjectList()
   		{
       
            return  wrapperTimeList;       
       
   		}
    public void GenerateInvoice()
    {
        
                Invoice1__c inv = new Invoice1__c();
        		list<Project1__c> pr = new list<Project1__c>([SELECT id,Name,Start_Date__c,End_Date__c,Account_Name__c,Total_Project_Hrs__c,Total_Invoice_Hours__c FROM Project1__c WHERE id =: prj.id]); 
     
                inv.Account__c =  pr[0].Account_Name__c;
                inv.Project_Name__c = pr[0].id;
                inv.Start_Date__c = pr[0].Start_Date__c;
                inv.End_Date__c = pr[0].End_Date__c;
                system.debug('This is ur output');
            	system.debug(inv);
                SeletedInvoice.add(inv);
            	system.debug(SeletedInvoice);
                
                
      
        insert  SeletedInvoice;
        Id invid = SeletedInvoice[0].id;
        system.debug(invid);
        Map<Id,Invoice1__c> projectInvoiceMap = new Map<Id, Invoice1__c>();
        for(Invoice1__c invo : SeletedInvoice)
        {
              projectInvoiceMap.put(invo.Project_Name__c, invo);
            
        }
        System.debug( projectInvoiceMap);
        system.debug('Yout selected Invoice'+ SeletedInvoice);
        //Id invId = SeletedInvoice[0].id;
        list<Invoice_Line_Item__c> insertItem = new list<Invoice_Line_Item__c>();
        list<Time_Entry__c> timeEntry = new list<Time_Entry__c>([SELECT id,
                                    	   							Billable_Amount__c,
                                           							Date__c,Description__c,
                                           							Duration__c,Invoiced__c,
                                           							Project__c,
                                           							Time_Entry__c,
                                                                    Time_Entry_Hours__c 
                                                                    FROM Time_Entry__c 
                                                                    where Project__c IN :projectInvoiceMap.keySet()
                                                                    and Invoiced__c = false]);
        
        	
             System.debug(timeEntry);
             for(Time_Entry__c t : timeEntry)
            	
             {
                   
                    
                     Invoice_Line_Item__c item = new Invoice_Line_Item__c();
                     item.Invoice_Hrs__c = t.Duration__c;
                     item.Entry_Date__c = t.Date__c;
                     item.Description__c = t.Description__c;
                     item.Time_Entry__c = t.id;
                     item.Invoice1__c =  projectInvoiceMap.get(t.Project__c).id;
                     insertItem.add(item);
                     system.debug('line item');
                     t.Invoiced__c= true;
                    timee.add(t);
                     System.debug( insertItem);
                 }
             
         
       
         insert insertItem;
       update timee;
        
    }

    
    public class WrapperTime
	{
    	public Time_Entry__c te{get;set;}
    
    	public boolean isSelected{get;set;}
    
   		public WrapperTime(Time_Entry__c timeEntry)
    	{
            System.debug('In wrapper class');
            this.te = timeEntry;
            isSelected = true;
        
    	}
    
    
	}
    
    
   

}