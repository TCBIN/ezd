//
//  BaseResponse.h
//  VictorOC
//
//  Created by WebUser on 17/3/1.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  公共服务器返回 可以根据实际项目修改属性名
 */
@interface BaseResponse : NSObject

/**获取json数据状态*/
@property(nonatomic, assign) BOOL status;

/**错误码*/
@property(nonatomic, assign) int errorCode;

/**错误信息*/
@property(nonatomic, copy) NSString *errorMsg;

/**true:正常业务错误errorMsg可以显示给用户查看,false:内部错误errorMsg不能显示给用户*/
@property(nonatomic, assign) BOOL isShow;

@end
