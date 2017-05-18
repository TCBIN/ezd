//
//  ResultResponse.m
//  VictorOC
//
//  Created by WebUser on 17/3/1.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "ResultResponse.h"

@implementation ResultResponse

@end

//首页model
@implementation HomeResponse

+(void)load
{
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"data":[HomeResModel class]};
    }];
}

@end
