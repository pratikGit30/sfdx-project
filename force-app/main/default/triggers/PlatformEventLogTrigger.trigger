trigger PlatformEventLogTrigger on Platform_Log_Event__e (after insert) {
       
       List<Apex_Error__c> errorLogs = new List<Apex_Error__c>();
       for(Platform_Log_Event__e logEvent : Trigger.new){
            Apex_Error__c logLineItem = new Apex_Error__c();
          
            logLineItem.Class_Name__c = logEvent.Class_Name__c;
            logLineItem.Exception_Type__c = logEvent.Exception_Type__c;

            //logLineItem.User_Email__c = logEvent.User_Email__c;
            
            errorLogs.add(logLineItem);
        }
        
        insert errorLogs;

}