#  AWS - Amazon S3
 
 ## What it Amazon S3
see [Amazon S3](https://en.wikipedia.org/wiki/Markdown)
Amazon S3 is cloud storage for the internet. To upload your data (photos, videos, documents etc.), you first create a bucket in one of the AWS Regions. You can then upload any number of objects to the bucket.


##  About this class 

This class have  three main function 
1  `configure() ` : Here  you set your bucketName , accessToken and Secret Key 
2  ` upload() `    upload  the data to the bucket  , with type  and get  the call back of key and type you send  


Function declaration 
```
func upload(key: String? = NSUUID().uuidString, data: Data, type: LeoAwsS3.TypeFile? = .image, callbackKey: ((String, LeoAwsS3.TypeFile) -> ())? = nil)

```

Function  calling 
```
LeoAwsS3.shared.upload( data: imahe) { (key, type) in

DispatchQueue.main.async {
Hud.hide(view: self.view)
self.add_album_media(key: key)
}

}
```

