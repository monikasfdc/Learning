public class OppTriggerHandler {
   @future
    public static void handlerMethod(Set<Id>userIds,Map<Id,Id>managerIds){
        List<Opportunity> opplist = new List<Opportunity>();
        for(Opportunity op:[select Id,isClosed,OwnerId from opportunity where OwnerId =:userIds and isClosed=false]){
            if(op.OwnerId!=null){
                Id newOwnerId =managerIds.get(op.OwnerId);
                 if(newOwnerId!=null){
                 op.OwnerId=newOwnerId;
                  opplist.add(op);
               }
            }
          
        }
        if(opplist.size()>0){
             update opplist;
        }
       
    }
}