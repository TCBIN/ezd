//
//  UploadFilesTool.h
//  VictorOC
//
//  Created by WebUser on 17/2/28.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import <Foundation/Foundation.h>
//数据解析
#import <MJExtension.h>
//网络请求
#import <AFNetworking.h>
#import <AFHTTPSessionManager.h>
//URL宏
#import "URLMacro.h"


// 获取当前进度使用 double类型数据接收  uploadProgress.fractionCompleted
typedef void(^Progress_Block)(NSProgress *uploadProgress);
// 获取返回值判断是否为字典，从字典中取值
typedef void(^Success_Block)(id result);
typedef void(^Failure_Block)(NSError *error);

typedef void(^Successs_Block)(NSArray *resultArray);
typedef void(^Failures_Block)(NSArray *errorArray);


@interface AFHttpTool : NSObject


// GET请求
+ (void)getWithURLString:(NSString *)spliceUrl
              parameters:(id)parameters
             resultClass:(Class)resultClass
                 success:(Success_Block)success
                 failure:(Failure_Block)failure;


// POST请求
+ (void)postWithURLString:(NSString *)spliceUrl
               parameters:(id)parameters
                  resultClass:(Class)resultClass
                  success:(Success_Block)success
                  failure:(Failure_Block)failure;

//get合并网络请求
+ (void)loadWithURLArray:(NSArray *)urlArray
          parameterArray:(NSArray *)parameterArray
        resultClassArray:(NSArray *)resultClassArray
                 success:(Successs_Block)success
                 failure:(Failures_Block)failure;

// 上传图片
+ (void)uploadImageWithURLString:(NSString *)spliceUrl
                      parameters:(id)parameters
                      uploadData:(NSData *)uploadData
                      uploadName:(NSString *)uploadName
                     resultClass:(Class)resultClass
                        progress:(Progress_Block)progress
                         success:(Success_Block)success
                         failure:(Failure_Block)failure;

// 上传多张图片
+ (void)uploadImagesWithURLString:(NSString *)spliceUrl
                       parameters:(id)parameters
                      uploadDatas:(NSMutableArray *)uploadDatas
                       uploadName:(NSString *)uploadName
                      resultClass:(Class)resultClass
                         progress:(Progress_Block)progress
                          success:(Success_Block)success
                          failure:(Failure_Block)failure;

@end
