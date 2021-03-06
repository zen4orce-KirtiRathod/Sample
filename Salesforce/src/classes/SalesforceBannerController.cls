public class SalesforceBannerController {
    public list<SelectOption> objects {get;set;}
    public string choosenObject {get;set;}
    public Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
    public string choosenButtonType{get;set;}
    public string choosenMobilePhone{get;set;}
    public Schema.SObjectType sobjtype1;
    public string choosenOptOutField {get;set;}
    public string choosenopField{get;set;}	
    public list<selectOption> Mphonelist {get;set;}
    public list<selectOption> OutList {get;set;}
    
    //Get the list of Object in the Constructor
    public SalesforceBannerController()
    {
       try{
    		  Schema.SObjectType type = gd.get(choosenObject);
            //list<String> org = new list<String>();
            Organization org = [SELECT NamespacePrefix FROM Organization];
            

            String nameSpace = String.valueOf(org.NamespacePrefix);
                 System.debug('kjlfkj');
                 system.debug(gd);
                objects = new list<selectoption>();
                list<String> sortObject = new list<String>();
                sortObject.addAll(gd.KeySet());
                sortObject.sort();
                choosenObject = 'NONE';
                choosenMobilePhone = ' ';
                choosenOptOutField = ' ';
                objects.add(new selectOption('NONE','NONE'));
                choosenopField = 'Yes';
                integer i =0;
                DescribeSObjectResult[] results = Schema.describeSObjects(sortObject);
            /*
             for(Schema.DescribeSObjectResult res : results)
             {
                 String  r1 = res.getName();
                 system.debug(r1);
                 system.debug(i);
                 i++;
             }
               */  
                System.debug(results.get(1));
            	System.debug(results.get(4));
                System.debug(results.get(66));
                System.debug(results.get(147));
                System.debug(results.get(178));
                System.debug(results.get(187));
            
            	DescribeSObjectResult desObj = results[0];
            	System.debug(desObj);
                System.debug(desObj.getName());
                
        	    for(Schema.DescribeSObjectResult res : results)
                {
                    String resString = res.getName();
                    if(!res.isCustomSetting() && !res.isCustom()  && res.getRecordTypeInfos().size() > 0  && res.isSearchable() && res.isDeletable() && res.isCreateable() && res.isUpdateable()  && res.isUndeletable() && !resString.containsIgnoreCase('Idea') && !resString.containsIgnoreCase('PriceBook'))
                   		 {
                            objects.add(new selectOption(res.getName(),res.getLabel()));
                            System.debug('in fisrt loop');
                    	 }
                   
                   
                        if((res.isCustom() && resString.containsignorecase(nameSpace)) )
                        {
                                System.debug('hello');
                                objects.add(new selectOption(res.getName(),res.getLabel()));
                        }
                    }
                }
         
        catch(Exception e)
        {
            System.debug('An exception occurred: ' + e.getMessage());
        }
    }
     public static MetadataService.MetadataPort createService()
    {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        System.debug('UserInfo.getSessionId()' + UserInfo.getSessionId());
        return service;
    }
    
  
    // Get the Populated field of Mobile Phone list and Boolean Value in one method
    public PageReference populateFields()
    {
        try{
                Mphonelist = new list<SelectOption>();
                OutList = new list<SelectOption>();
                if(choosenObject != 'NONE')
                {
                    Mphonelist = getMobilePhone();
                    OutList = getOptoutField();
                }
        }
        catch(Exception e)
        {
            System.debug('An exception occurred: ' + e.getMessage());
        }
        return null;
                    
    }
    // Get Method for getting list of Object
  public list<selectoption> getlistOfObject()
  {
      
      return objects;
  }
    //Get the list of SMS Button Type 
  public list<selectOption> getbuttonType()
  {
      list<selectOption> btype = new list<selectOption>();
      btype.add(new selectOption('Single','Single'));
      btype.add(new selectOption('Single Popup','Single Popup'));
      btype.add(new selectOption('Bulk','Bulk'));
      btype.add(new selectOption('Bulk Popup','Bulk Popup'));
      
      return btype;
          
  }
    //Get the list of DefaultOptoutField
    public list<selectOption> getDefaultOptoutField()
    {
        list<selectOption> opField = new list<selectOption>();
        opField.add(new selectOption('Yes','Yes'));
        opField.add(new selectOption('No','No'));
        return opField;
    }
    //Fetch the list of Mobile list 
  public list<selectOption> getMobilePhone()
  {
      list<selectOption> MPhoneList = new list<selectOption>();
   
          try
          {
              sobjtype1 = gd.get(choosenObject) ;
              system.debug(choosenObject);
              Map<String, Schema.SObjectField> fieldMap = sobjtype1 .getDescribe().fields.getMap();
               system.debug(fieldMap);
               if( choosenObject != 'NONE')
               {
                for(String fieldName : fieldMap.keySet())
                {
                  
                    schema.describefieldresult dfield = fieldMap.get(fieldName).getDescribe();
                    Boolean formulaField = isFormula(fieldMap.get(fieldName));
                    
                    //It provide to get the object field data type.
                    Schema.DisplayType fdataType = fieldMap.get(fieldName).getDescribe().getType();
                  
                    if(fdataType == Schema.DisplayType.STRING && fdataType != Schema.DisplayType.ADDRESS ||fdataType == Schema.DisplayType.PHONE)
                    {
                         MPhoneList.add(new selectOption(String.valueOf(fieldName),String.valueOf(fieldName)));
                    }
                    else if(formulaField== true && fdataType == Schema.DisplayType.STRING)
            		{
                 		MPhoneList.add(new selectOption(String.valueOf(fieldName),String.valueOf(fieldName)));
            		}
                   
                }
         
      		 	} 
              else
              {
                  MPhoneList = null;
              }
          }
       catch(Exception e)
       {
           System.debug(e.getMessage());
       }
     
    return MPhoneList;
  }
    //Fetch the list of SMS Optout Fields
  public list<selectOption> getOptoutField()
  {
      list<selectOption> OutField = new list<selectOption>();
   
          try
          {
          sobjtype1 = gd.get(choosenObject);      
          Map<String, Schema.SObjectField> fieldMap = sobjtype1 .getDescribe().fields.getMap();
          if( choosenObject != 'NONE')
           {
        		for(String fieldName : fieldMap.keySet())
        		{
          
                        //It provide to get the object field data type.
                        Schema.DisplayType fdataType = fieldMap.get(fieldName).getDescribe().getType();
                        schema.describefieldresult dfield = fieldMap.get(fieldName).getDescribe();
                        Boolean formulaField = isFormula(fieldMap.get(fieldName));
                        if(fdataType == Schema.DisplayType.BOOLEAN)
                        {
                             OutField.add(new selectOption(String.valueOf(fieldName),String.valueOf(fieldName)));
                        }
                        else if(formulaField== true && fdataType == Schema.DisplayType.BOOLEAN)
                        {
                             OutField.add(new selectOption(String.valueOf(fieldName),String.valueOf(fieldName)));
                        }
                        
                   } 
           
           }
          
          else
          {
              OutField = null;
          }
      }
      catch(Exception e)
      {
      	System.debug(e.getMessage());
      }
      return OutField;
   
  } 
    // Method to Find Formula Field
    public static Boolean isFormula(SObjectField field)
	{
    	return field.getDescribe().isCalculated();
	}
    public void Create()
    {
        
        try
        {
            if(choosenButtonType == 'Single')
            {
                 MetadataServiceExamples.readAndUpdateLayout(choosenObject, SendSMS(), generateRandomString(3), generateRandomString(3));
                
            }
        }
        

        catch(Exception e)
        {
          
          MetadataServiceExamples.readAndUpdateLayout(choosenObject, SendSMS(),generateRandomString(3),generateRandomString(3));
           
         
            System.debug(e.getMessage());
              
        }
           
    }
    public  String generateRandomString(Integer len) {
    final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
    String randStr = '';
    while (randStr.length() < len) {
       Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
       randStr += chars.substring(idx, idx+1);
    }
      
   return randStr; 
}
    
    public String SendSMS()
    {
       String s1 = 
            '{!REQUIRESCRIPT("/soap/ajax/14.0/connection.js")} '+
            '{!REQUIRESCRIPT("/soap/ajax/14.0/apex.js")} '+
            '{!REQUIRESCRIPT("/resource/smagicinteract__smJQuery/js/jquery-1.10.2.js")}'+ 
            '{!REQUIRESCRIPT("/resource/smagicinteract__smJQuery/js/jquery-ui-1.10.4.custom.min.js")} '+
            '{!REQUIRESCRIPT("/resource/smagicinteract__sendSMSJS")}'+
            'var packagePrefix = "smagicinteract__";'+ 
            'var recordType = "lead";'+
            'var idToUpdate = "{!Lead.Id}";'+ 
            'var nameField = "Name";'+ 
            'var mobileField = "choosenMobilePhone"; '+
            'var optOutField = "choosenOptOutField";'+
            'var optOutDefaultValue = "choosenopField";'+
            'var smsType = " "; '+
            'var userId = "{!$User.Id}";'+ 
            'var elementIdVar = " " ;'+ 
            'var showUserDropDown = false; '+
            'var dialogTitle = " "; '+
            'var cssUrl = "{!URLFOR("/resource/smagicinteract__smJQuery/css/sm-theme/jquery-ui-1.10.4.custom.min.css")}";'+
            'var relatedObjects = ‘<Related_Object_1>,<Related_Object_02>’; '+
            'openSMSPage(recordType, idToUpdate, userId, nameField, mobileField, optOutField, optOutDefaultValue, smsType, elementIdVar, packagePrefix, showUserDropDown, dialogTitle, cssUrl, relatedObjects);';
		
        return s1;
    }
}