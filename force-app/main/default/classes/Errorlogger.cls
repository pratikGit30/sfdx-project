public with sharing class Errorlogger {

    public static void publishLogMessage(Exception e, String className){
        
        Platform_Log_Event__e exceptionEvent = new Platform_Log_Event__e();
        
        exceptionEvent.Class_Name__c = className;
        exceptionEvent.Exception_Type__c = e.getTypeName();
        //exceptionEvent.User_Email__c = UserInfo.getUserEmail();
         EventBus.publish(exceptionEvent);
    }      
}
