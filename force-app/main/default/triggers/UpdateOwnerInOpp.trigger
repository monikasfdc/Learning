trigger UpdateOwnerInOpp on User (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        Set<Id> userIds = new Set<Id>();
        Map<Id,Id> managerIds = new Map<Id,Id>();
        for(User u:Trigger.new){
            if(u.IsActive == false && trigger.oldMap.get(u.Id).isActive == true){
                userIds.add(u.Id);
            }
        }
        
        for(User urec:[select Id,ManagerId from user where Id In :userIds]){
            if(urec.ManagerId!=null){
              managerIds.put(urec.Id,urec.ManagerId);  
            }
        }
        OppTriggerHandler.handlerMethod(userIds,managerIds);
    }

}