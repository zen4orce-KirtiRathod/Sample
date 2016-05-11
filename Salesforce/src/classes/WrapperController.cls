public class WrapperController {
   
    public Date startDate ;
    public Date lastDate;
    public Invoice1__c invoice;
    public list<WrapperProject> wrapperProjectList{get;set;} 
    Public list<Project1__c> selectedProjects{get;set;}
    public string value;
    list<Invoice1__c> SeletedInvoice = new list<Invoice1__c>();
    list<Invoice1__c>  newInvoice = new list<Invoice1__c>();
    list<Project1__c> newProject = new list<Project1__c>();
    list<Project1__c> Project = new list<Project1__c>();
	list<Time_Entry__c> te = new list<Time_Entry__c>();
    public  list<Invoice_Line_Item__c> insertItem = new list<Invoice_Line_Item__c>();
    public WrapperController(ApexPages.StandardController controller) {
        
                this.invoice = (Invoice1__c)controller.getRecord();
                startDate = System.Date.today().toStartOfMonth();
                lastDate = startDate.addMonths(1).addDays(-1);
                this.invoice.Start_Date__c = startDate;
                this.invoice.End_Date__c= lastDate;
                
 
                }
    
    public PageReference Search()
    {
       wrapperProjectList  = new list<WrapperProject>();
         Project = [SELECT id,Name,Start_Date__c,End_Date__c,Account_Name__c,Total_Project_Hrs__c,Total_Invoice_Hours__c FROM Project1__c WHERE Account_Name__c =: invoice.Account__c ]; 
         System.debug(project);
         for( Project1__c prj : project)
         {
             
             {
                
                 System.debug(prj);
                 wrapperProjectList.add(new WrapperProject(prj) );
                 System.debug(wrapperProjectList);
             }
         }
        return null;
    }
    
    public void GenerateInvoice()
    {
        selectedProjects = new list<Project1__c>();
        
        System.debug('Your TimeEntry'+te);
        for(WrapperProject wrapObj :wrapperProjectList )
        {
            if(wrapObj.isSelected == true)
            {
                selectedProjects.add(wrapObj.prj);
                System.debug(selectedProjects);
            }
        }
      Map<Id,Invoice1__c> projectInvoiceMap = new Map<Id, Invoice1__c>();
      for(Project1__c pr :selectedProjects)
      {
               
               Invoice1__c inv = new Invoice1__c();
        
                inv.Account__c =  pr.Account_Name__c;
                inv.Project_Name__c = pr.id;
                inv.Start_Date__c = pr.Start_Date__c;
                inv.End_Date__c = pr.End_Date__c;
                system.debug('This is ur output');
            	system.debug(inv);
                SeletedInvoice.add(inv);
            	system.debug(SeletedInvoice);
                
                
      }
        insert  SeletedInvoice;
        Id invid = SeletedInvoice[0].id;
        system.debug(invid);
        for(Invoice1__c invo : SeletedInvoice)
        {
              projectInvoiceMap.put(invo.Project_Name__c, invo);
            
        }
       System.debug( projectInvoiceMap);
       system.debug('Yout selected Invoice'+ SeletedInvoice);
        //Id invId = SeletedInvoice[0].id;
     
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
                    
                     System.debug( insertItem);
                 }
             
         
       
         insert insertItem;
         update te;
        
    }

        
        
        
    
public list<WrapperProject> getwrapperProjectList()
   {
       
            return wrapperProjectList;       
       
   }


public class Wrapperproject
{
    public Project1__c prj{get;set;}
    
    public boolean isSelected{get;set;}
    
    public WrapperProject(Project1__c project)
    {
        this.prj = project;
        isSelected = false;
        
    }
    
    
}  
    
    
}