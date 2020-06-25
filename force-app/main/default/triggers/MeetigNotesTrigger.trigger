trigger MeetigNotesTrigger on MeetingNote__c ( After insert) {
    
    List<MeetingNote__share> shareRecList = new List<MeetingNote__share>();
    
    for(MeetingNote__c meetingNote : Trigger.new){
        MeetingNote__share shareRec = new MeetingNote__share();
        shareRec.parentId = meetingNote.id;
        shareRec.UserOrGroupId= '0054R00000AISfKQAX';
        shareRec.AccessLevel = 'Edit';
        shareRecList.add(shareRec);
        
    }
    
    //insert shareRecList;
    try{
        insert shareRecList;
    }Catch(Exception e){
        Errorlogger.publishLogMessage(e, 'MeetigNotesTrigger');
    }  
}