global  class SchedualOpp implements Schedulable{
    
    global void execute(SchedulableContext ctx)
    {
       OppoSumBatch mybatchObject = new OppoSumBatch();
       Id batchId = Database.executeBatch(mybatchObject);
        
    }

}