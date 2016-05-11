@isTest

public class QueryBuilderTestClass {
    
    public static  testMethod void callOneFiledMethods() {
        
        QueryBuilder controller  = new QueryBuilder();
        controller.choosenObject = 'Account';
        controller.populateFields() ;
        controller.choosenFields.add('id');
        controller.trnsfer();
        System.assertEquals('SELECT id FROM Account ORDER BY id ASC LIMIT 500',controller.item);
        controller.ExecuteQuery();
      
    } 
    public static testMethod void callmultipleFiledMethod()
    {
		QueryBuilder controller  = new QueryBuilder();
        controller.choosenObject = 'Account';
        controller.populateFields();
        controller.choosenFields.add('id');
        controller.choosenFields.add('Name');
        controller.choosenFields.add('isdeleted');
        controller.choosenFields.add('type');
        controller.trnsfer();
        System.assertEquals('SELECT id,Name,isdeleted,type FROM Account ORDER BY id ASC LIMIT 500',controller.item);
        controller.ExecuteQuery();        
           
    }
    public static testMethod void callDifferentObejct()
    {
        QueryBuilder controller  = new QueryBuilder();
        controller.choosenObject = 'Account';
        controller.populateFields();
        controller.choosenObject = 'Contact';
        controller.populateFields();
        controller.choosenFields.add('id');
        controller.choosenFields.add('isdeleted');
        controller.trnsfer();
        controller.getqueryLimit();
        controller.getRecordList();
        System.assertEquals('SELECT id,isdeleted FROM Contact ORDER BY id ASC LIMIT 500',controller.item);
        controller.ExecuteQuery();
       
    }
    public static testMethod void testForObject()
    {
        QueryBuilder controller  = new QueryBuilder();
        controller.choosenObject = 'Account';
        controller.populateFields();
        controller.choosenFields.add('id');
        controller.choosenFields.add('Name');
        controller.choosenFields.add('isdeleted');
        controller.choosenFields.add('type');
        controller.trnsfer();
        controller.getqueryLimit();
        controller.getRecordList();
        System.assertEquals('SELECT id,Name,isdeleted,type FROM Account ORDER BY id ASC LIMIT 500',controller.item);
        controller.ExecuteQuery();
        controller.choosenObject = 'Contact';
        controller.populateFields();
        controller.choosenFields.add('id');
        controller.choosenFields.add('isdeleted');
        controller.trnsfer();
        controller.getqueryLimit();
        controller.getRecordList();
        System.assertEquals('SELECT id,isdeleted FROM Contact ORDER BY id ASC LIMIT 500',controller.item);
        controller.ExecuteQuery();
      
        
    }
    
    
}