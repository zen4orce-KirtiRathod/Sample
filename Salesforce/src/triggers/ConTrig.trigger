trigger ConTrig on Contact (before insert,before update) {
        
            HandlerForConatct.afterinsert(Trigger.new); 
        }