#  AWS - Amazon S3

## What it Amazon S3
see [Amazon S3](https://aws.amazon.com/s3/)
Amazon S3 is cloud storage for the internet. To upload your data (photos, videos, documents etc.), you first create a bucket in one of the AWS Regions. You can then upload any number of objects to the bucket.


##  About this class.

This class have  three main function 

-  `configure() ` : Here  you set your bucketName , accessToken and Secret Key 
This class required three things  in configure method 
* ` accessKey` and  ` secretKey`  is  of the user who have access to read and write in the S3 bucket. 
Please make sure you have given the premission to read  and write to S3 bucket. It will be assign for every user from AWS who want to access the bucket
* `bucketName`  bucket name where you have to upload the data 


-  ` upload() `    upload  the data to the bucket  , with type  and get  the call back of key and type you send  

Function declaration 
```swift
func upload(key: String? = NSUUID().uuidString, data: Data, type: LeoAwsS3.TypeFile? = .image, callbackKey: ((String, LeoAwsS3.TypeFile) -> ())? = nil)

```

Function  calling 
```swift

LeoAwsS3.shared.upload( data: imahe) { (key, type) in




}
```
-  ` download() `    download  the data from the bucket  , with key  it gives back you the data of file you uploaded. 

Function declaration 
```swift
func download(key: String, callbackData: ((Data?) -> ())? = nil)

```
Function  calling 
```swift
LeoAwsS3.shared.download(key: media.media_url.leoSafe()) { data in
DispatchQueue.main.async {

if let image = UIImage(data: data!) {
}
}

}
```
___


### Permission 
```

```

