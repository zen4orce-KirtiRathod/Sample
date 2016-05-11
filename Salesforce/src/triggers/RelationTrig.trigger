trigger RelationTrig on Account (after update) 
{
    if(Trigger.isafter)
    {
        if(Trigger.isUpdate)
        {
            AccountHandlerFor.afterUpdate(Trigger.new,Trigger.old);
        } 
   
    }
}