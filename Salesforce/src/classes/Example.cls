public class Example {
   
    public Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
    public list<String> objects = new list<String>();
    public  Example()
    {
        try{
                    
                
                Organization org = [SELECT NamespacePrefix FROM Organization];
                String nameSpace = String.valueOf(org.NamespacePrefix);
                list<String> sortObject = new list<String>();
                sortObject.addAll(gd.KeySet());
                sortObject.sort();
                DescribeSObjectResult[] results = Schema.describeSObjects(sortObject);
       
                for(Schema.DescribeSObjectResult res : results)
                {
                    String resString = res.getName();
                    if(!res.isCustomSetting() && !res.isCustom()  && res.getRecordTypeInfos().size() > 0  && res.isSearchable() && res.isDeletable() && res.isCreateable() && res.isUpdateable()  && res.isUndeletable() )
                   		 {
                            objects.add(res.getname());
                            
                    	 }
                    if((res.isCustom() && resString.containsignorecase(nameSpace)) )
                        {
                                
                            objects.add(res.getname());
                        }
                    }
                }
         
        catch(Exception e)
        {
            System.debug('An exception occurred: ' + e.getMessage());
        }
    }
    
      public list<String> getlistOfObject()
  		{
        		 return objects;
 		}

}