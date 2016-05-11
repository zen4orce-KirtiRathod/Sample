public class QueryBuilder {
    public list<SelectOption> objects {get;set;}
    public list<SObject>  records{get;set;}
    public string choosenObject {get;set;}
    public list<SelectOption> secondlist{get;set;}
    public list<String> selectedFiels{get;set;}
    public list<String> choosenFields{get;set;}
    public string selectedlimit{get;set;}
    public string seletedRecord{get;set;}
    public String item{get;set;}
    public  list<SelectOption> fieldSet{get;set;}
    public Map<String , Schema.SObjectType> gd = Schema.getGlobalDescribe();
    public Schema.SObjectType sobjtype1;
    public  QueryBuilder ()
    {
        item = null;
        objects = new list<selectoption>();
      
        choosenObject = 'NONE';
        secondlist = new list<selectOption>();
        list<String> sortObject = new list<String>();
        sortObject.addAll(gd.KeySet());
        sortObject.sort();
       
        Schema.DescribeSObjectResult[] results = Schema.DescribeSObjects(sortObject);
        objects.add(new selectOption('None','None'));
        for(Schema.DescribeSObjectResult res  : results)
        {
         	
            objects.add(new selectOption(res.getName(),res.getLabel()));
        }
   
    }
    public PageReference populateFields()
    {
       
        choosenFields = new list<String>();
        fieldSet = new list<SelectOption>();
        secondlist = new list<SelectOption>();
        selectedFiels = new List<String>();
        item ='';
        records = new list<SObject>();
        sobjtype1 = gd.get(choosenObject);
      
        Map<String, Schema.SObjectField> fieldMap = sobjtype1 .getDescribe().fields.getMap();
       
        
        for(String s : fieldMap.keySet())
        {
            fieldSet.add(new selectoption(s,s));
            
        }
        
        
      return null;
    }
    
    public void trnsfer()
    {
      		  
        item = '';
       
        for(String se : choosenFields)  
        {
            secondlist.add(new selectoption(se,se));
        }
        seletedRecord = 'ORDER BY id ASC';
        selectedlimit = 'LIMIT 500';
      
        list<String> commaString = new list<String>();
     
      	String s = 'SELECT ';
      	 integer i = 1;
        for(String chosenFld : choosenFields)
        {
            if(i < choosenFields.size())
            {
                s = s + chosenFld + ',';
            }
            else
            {
                 s = s + chosenFld + ' ';
            }
            i = i+1;
        }
    
       s = s+ 'FROM'+' '+choosenObject +' '+seletedRecord +' '+selectedlimit;
        item = s;
      
     
  }  
    
  public list<selectOption> getqueryLimit()
    {
        list<selectoption> queryLimit = new list<selectoption>();
             
          
            queryLimit.add(new selectOption ('LIMIT 500','500'));
            queryLimit.add(new selectOption('LIMIT 1000','1000'));
            queryLimit.add(new selectOption('LIMIT 5000','5000'));
            queryLimit.add(new selectOption('LIMIT 50000','50000'));
          
        	return queryLimit;
         }
        
        
    
    public list<selectOption> getRecordList()
    {
        
                
        list<selectOption> recordList = new list<selectOption>();
        recordList.add(new selectOption('ORDER BY id ASC ','ASC'));
        recordList.add(new selectOption('ORDER BY id DES ','DSC'));
       
        return recordList;
        }
        
    
  public void ExecuteQuery()
  {
     
      if(item != null)
      {
         
          records = database.query(item);
      }
     
      choosenObject =  '';
      selectedFiels = new List<String>();
    
    }
  
}