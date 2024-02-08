public with sharing class ProfilePhotoController {
    @AuraEnabled
    public static String getProfilePhotoUrl(String parentId) {
        ContentDocumentLink cdl = [SELECT ContentDocument.LatestPublishedVersionId FROM ContentDocumentLink WHERE LinkedEntityId = :parentId AND ContentDocument.FileType = 'JPG' AND ContentDocument.FileExtension = 'jpg' LIMIT 1];
        return cdl.ContentDocument.LatestPublishedVersion.VersionData.toString();
    }

    @AuraEnabled
    public static String uploadProfilePhoto(String parentId, String contentDocumentId) {
        // Delete existing profile photo
        deleteProfilePhoto(parentId);
        
        // Create new ContentDocumentLink
        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.LinkedEntityId = parentId;
        cdl.ContentDocumentId = contentDocumentId;
        insert cdl;
        
        // Return profile photo URL
        return getProfilePhotoUrl(parentId);
    }
    
    @AuraEnabled
    public static void deleteProfilePhoto(String parentId) {
        ContentDocumentLink cdl = [SELECT Id FROM ContentDocumentLink WHERE LinkedEntityId = :parentId AND ContentDocument.FileType = 'JPG' AND ContentDocument.FileExtension = 'jpg' LIMIT 1];
        if (cdl != null) {
            delete cdl;
        }
    }
    @AuraEnabled(cacheable=false)
    public static ContentDocumentLink uploadProfilePicture(String fileName, String base64Data) {
    Blob blobData = EncodingUtil.base64Decode(base64Data);
    ContentVersion contentVersion = new ContentVersion();
    contentVersion.Title = fileName;
    contentVersion.VersionData = blobData;
    insert contentVersion;
    
    // Get the user's existing profile picture
    List<ContentDocumentLink> cdlList = [SELECT Id FROM ContentDocumentLink WHERE LinkedEntityId = :UserInfo.getUserId() AND ContentDocument.FileType = 'JPG' AND ContentDocument.FileExtension = 'jpg' LIMIT 1];
    if (!cdlList.isEmpty()) {
        delete cdlList;
    }
    
    ContentDocumentLink contentDocumentLink = new ContentDocumentLink();
    contentDocumentLink.ContentDocumentId = [SELECT Id FROM ContentVersion WHERE Id = :contentVersion.Id].ContentDocumentId;
    contentDocumentLink.LinkedEntityId = UserInfo.getUserId();
    contentDocumentLink.ShareType = 'I';
    insert contentDocumentLink;
    return contentDocumentLink;
}
}