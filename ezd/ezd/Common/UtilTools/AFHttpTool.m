//
//  UploadFilesTool.m
//  VictorOC
//
//  Created by WebUser on 17/2/28.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "AFHttpTool.h"

@implementation AFHttpTool

// GET请求
+ (void)getWithURLString:(NSString *)spliceUrl
              parameters:(id)parameters
             resultClass:(Class)resultClass
                 success:(Success_Block)success
                 failure:(Failure_Block)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseURL,spliceUrl];
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        kNSLog(@"\n 请求url %@\n 参数 %@\n 结果 %@\n",url,parameters,responseObject);
        id keyValues = [responseObject mj_JSONObject];
        if (resultClass!=nil) {
            id resultObject = [resultClass mj_objectWithKeyValues:keyValues];
            if (success) {
                success(resultObject);
            }
        }else{
            if (success) {
                success(responseObject);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        kNSLog(@"\n 请求url %@\n 参数 %@\n failure %@\n",url,parameters,error);
        if (failure) {
            failure(error);
        }
    }];
}


// POST请求
+ (void)postWithURLString:(NSString *)spliceUrl
               parameters:(id)parameters
              resultClass:(Class)resultClass
                  success:(Success_Block)success
                  failure:(Failure_Block)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseURL,spliceUrl];
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        kNSLog(@"\n 请求url %@\n 参数 %@\n 结果 %@\n",url,parameters,responseObject);
        id keyValues = [responseObject mj_JSONObject];
        if (resultClass!=nil) {
            id resultObject = [resultClass mj_objectWithKeyValues:keyValues];
            if (success) {
                success(resultObject);
            }
        }else{
            if (success) {
                success(responseObject);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        kNSLog(@"\n 请求url %@\n 参数 %@\n failure %@\n",url,parameters,error);
        if (failure) {
            failure(error);
        }
    }];
}
//get合并网络请求
+ (void)loadWithURLArray:(NSArray *)urlArray
          parameterArray:(NSArray *)parameterArray
        resultClassArray:(NSArray *)resultClassArray
                 success:(Successs_Block)success
                 failure:(Failures_Block)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    //串行队列
    dispatch_queue_t queue = dispatch_queue_create("TCB", DISPATCH_QUEUE_SERIAL);
    dispatch_set_target_queue(queue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0));
    NSMutableArray *successArray = [NSMutableArray array];
    NSMutableArray *errorArray = [NSMutableArray array];
    for (int i=0;i<urlArray.count;i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSString *url = [NSString stringWithFormat:@"%@%@",BaseURL,urlArray[i]];
            [manager GET:url parameters:parameterArray[i] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                kNSLog(@"\n 处理第%d个 请求url %@\n 参数 %@\n 结果 %@\n",i+1,url,parameterArray[i],responseObject);
                id keyValues = [responseObject mj_JSONObject];
                if (resultClassArray[i]!=nil) {
                    id resultObject = [resultClassArray[i] mj_objectWithKeyValues:keyValues];
                    [successArray addObject:resultObject];
                }else{
                    [successArray addObject:responseObject];
                }
                if (i==urlArray.count-1&&success) {
                    success(successArray);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                kNSLog(@"\n 处理第%d个 请求url %@\n 参数 %@\n failure %@\n",i+1,url,parameterArray[i],error);
                [errorArray addObject:error];
                if (i==urlArray.count-1&&failure) {
                    failure(errorArray);
                }
            }];
        });
    }
}

#pragma mark -- 上传单张图片 --
+ (void)uploadImageWithURLString:(NSString *)spliceUrl
                      parameters:(id)parameters
                      uploadData:(NSData *)uploadData
                      uploadName:(NSString *)uploadName
                     resultClass:(Class)resultClass
                        progress:(Progress_Block)progress
                         success:(Success_Block)success
                         failure:(Failure_Block)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseURL,spliceUrl];
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id< AFMultipartFormData >  _Nonnull formData) {
        [formData appendPartWithFileData:uploadData name:uploadName fileName:[NSString stringWithFormat:@"%@.png",uploadName] mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        kNSLog(@"\n 请求url %@\n 参数 %@\n 结果 %@\n",url,parameters,responseObject);
        id keyValues = [responseObject mj_JSONObject];
        if (resultClass!=nil) {
            id resultObject = [resultClass mj_objectWithKeyValues:keyValues];
            if (success) {
                success(resultObject);
            }
        }else{
            if (success) {
                success(responseObject);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        kNSLog(@"\n 请求url %@\n 参数 %@\n failure %@\n",url,parameters,error);
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark -- 上传多张图片 --
+ (void)uploadImagesWithURLString:(NSString *)spliceUrl
                       parameters:(id)parameters
                      uploadDatas:(NSMutableArray *)uploadDatas
                       uploadName:(NSString *)uploadName
                      resultClass:(Class)resultClass
                         progress:(Progress_Block)progress
                          success:(Success_Block)success
                          failure:(Failure_Block)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseURL,spliceUrl];
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id< AFMultipartFormData >  _Nonnull formData) {
        for (int i=0; i<uploadDatas.count; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%@[%d]", uploadName, i];
            [formData appendPartWithFileData:uploadDatas[i] name:imageName fileName:[NSString stringWithFormat:@"%@%d.JPEG",uploadName,i] mimeType:@"image/JPEG"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        kNSLog(@"\n 请求url %@\n 参数 %@\n 结果 %@\n",url,parameters,responseObject);
        id keyValues = [responseObject mj_JSONObject];
        if (resultClass!=nil) {
            id resultObject = [resultClass mj_objectWithKeyValues:keyValues];
            if (success) {
                success(resultObject);
            }
        }else{
            if (success) {
                success(responseObject);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        kNSLog(@"\n 请求url %@\n 参数 %@\n failure %@\n",url,parameters,error);
        if (failure) {
            failure(error);
        }
    }];
}

@end
