public class Invoice {
    
   
    public Date startDate ;
    public Date lastDate;
    public Invoice1__c invoice;
    
    
    public string value;
    list<Invoice1__c>  newInvoice = new list<Invoice1__c>();
    list<Project1__c> newProject = new list<Project1__c>();
    list<Project1__c> Project = new list<Project1__c>();

    public Invoice(ApexPages.StandardController controller) {
        
                this.invoice = (Invoice1__c)controller.getRecord();
                startDate = System.Date.today().toStartOfMonth();
                lastDate = startDate.addMonths(1).addDays(-1);
                this.invoice.Start_Date__c = startDate;
                this.invoice.End_Date__c= lastDate;
                
 
                }
    
    public PageReference Search()
    {
       
         Project = [SELECT id,Name,Start_Date__c,End_Date__c,Account_Name__c,Total_Project_Hrs__c,Total_Invoice_Hours__c FROM Project1__c WHERE Account_Name__c =: invoice.Account__c ];     
         for( Project1__c prj : project)
         {
             if(prj.Start_Date__c >= invoice.Start_Date__c && prj.End_Date__c <= invoice.End_Date__c)
             {
                newProject.add(prj);
             }
         }
        return null;
    }
    public list<Project1__c> getnewProject ()
    {
        
        return newProject;
    }


}