/*
*    AUTHOR : Avi (avidev9@gmail.com)
*    DESCRIPTION : Please note this is a early release of this component I will be updating this component and will completing the same with proper test classes
*
**/
public class VFZip_Con {
    public Integer randomInt{get;set;}
    
    public VFZip_Con(){
        randomInt = getRandomNumber(10000);
    }
    
    @RemoteAction
    public static List<AttachmentWrapper> getAttachments(String attachmentIdCSV){
        List<String> attachmentIds = attachmentIdCSV.split(',');
        return wrapAttachments([SELECT Id,Name,Body FROM Attachment WHERE Id IN:attachmentIds]);
    }
    
    
    private static List<AttachmentWrapper> wrapAttachments(List<Attachment> attachments){
        List<AttachmentWrapper> wrappers = new List<AttachmentWrapper>();
        for(Attachment att : attachments){
            wrappers.add(new AttachmentWrapper(att));
        }
        
        return wrappers;
    }
    
    public class AttachmentWrapper{
        public Attachment AttachmentObj;
        public String base64Body;
        
        public AttachmentWrapper(Attachment AttachmentObj){
            this.AttachmentObj  = AttachmentObj;
            this.base64Body = EncodingUtil.base64Encode(AttachmentObj.Body);
            this.AttachmentObj.Body = NULL;
        }
    }
    
    /*
    *Random number generator to change the js function name if multiple components us
    ***/
    private Integer getRandomNumber(Integer size){
        Double d = Math.random() * size;
        return d.intValue();
    }
}