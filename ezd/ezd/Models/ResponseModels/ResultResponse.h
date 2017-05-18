//
//  ResultResponse.h
//  VictorOC
//
//  Created by WebUser on 17/3/1.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "BaseResponse.h"
#import <MJExtension.h>
@interface ResultResponse : BaseResponse

@end

//首页model
#import "HomeResModel.h"

@interface HomeResponse : BaseResponse

@property(nonatomic, strong) NSArray *data;

@end
//我的model
#import "UserDataModel.h"
@interface UserResponse : BaseResponse

@property(nonatomic, strong) UserDataModel *data;

@end

//消息model……


