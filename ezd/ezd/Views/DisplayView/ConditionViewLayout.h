//
//  ConditionViewLayout.h
//  ezd
//
//  Created by WebUser on 17/4/10.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import <MyLayout/MyLayout.h>


@interface ConditionViewLayout : MyRelativeLayout

@property(nonatomic, copy) void(^filterBlock)(BOOL isShow);

@end
