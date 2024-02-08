public class tokenchallenge {
    public static string getToken(string mobileNo){
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);
        return encodingutil.base64Encode(hash);
    }
}