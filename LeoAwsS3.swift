//
//  LeoAwsS3.swift
//  SharePhotoApp
//
//  Created by tecH on 15/05/19.
//  Copyright © 2019 vijayvir Singh. All rights reserved.


import AWSS3
import AWSCore
import Foundation
class LeoAwsS3 {
    
    enum TypeFile : String  {
        case image = "image/jpeg"
    }
    
    static var  shared : LeoAwsS3 = LeoAwsS3()

    let accessKey = "*****7CEWO6OW"
    let secretKey = "*****cpT+PEpfRWHiOmrpBxWuBUI4R4lad"
    let bucketName = "*****imageapp"
    let bucketArn = "*****::testshareimageapp"
    
    private init() {

        configure()
    }
    
    func run(_ callback : (() -> ())? = nil ) {
        callback?()
    }
 
    private func configure() {
        let credentialsProvider2 = AWSStaticCredentialsProvider(accessKey: accessKey,
                                                                secretKey: secretKey)
        let configuration = AWSServiceConfiguration(region: AWSRegionType.USEast2,
                                                    credentialsProvider: credentialsProvider2)
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
    }

    func upload(key :String? = NSUUID().uuidString ,
                data : Data ,
                type : TypeFile? = .image ,
                callbackKey: ((String , TypeFile ) -> ())? = nil  ){
        
        let transferManager = AWSS3TransferUtility.default()
        
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.progressBlock = { (task , progress) in
            
            print("progress->",progress.fractionCompleted)
        }

        transferManager.uploadData(data,
                                   bucket: bucketName,
                                   key: key!,
              contentType: "image/jpeg",
              expression: expression) { (task, error) in
                if error  == nil {
                    callbackKey?(key! , type! )
                }
                
       
                
            }.continueWith { (task) -> Any? in
                if (task.result != nil) {
                    print("beginning upload")
                }
                
                return nil;
        }
        
    }
    

    
    func download(key : String ,  callbackData : ((Data?) -> ())? = nil ) {
    
   
        let expression = AWSS3TransferUtilityDownloadExpression()
        expression.progressBlock = { (task , progress) in
           // print("progress->",progress.fractionCompleted)
            
        }
        let transferUtility = AWSS3TransferUtility.default()
        transferUtility.configuration.maxRetryCount = 2
        
        transferUtility.downloadData(fromBucket: bucketName,
                                     key: key, expression: expression)  { (task, url, data, erroe) in
                                        if data != nil {
                                            callbackData?(data)
                                        }
                          
                                                                                
        }
        
        
    }
    
    
    
    
    
}


