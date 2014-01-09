/*
*    AUTHOR : Avi (avidev9@gmail.com)
*    DESCRIPTION : Please note this is a early release of this component I will be updating this component and will completing the same with proper test classes
*
**/
@istest
private class VFZip_Con_Test{
    static testMethod void testVFZIP(){
        Account acc = new Account(Name='Test VFZIP');
        insert acc;
        Attachment att = new Attachment(
                                            Name='TEST ATT',
                                            Body=Blob.valueOf('TEST CONTENT'),
                                            ParentId = acc.Id
                                        );
                                        
        insert att;
        VFZip_Con con = new VFZip_Con();
        VFZip_Con.getAttachments(att.id);
    }
}