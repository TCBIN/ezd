//
//  SearchViewLayout.h
//  ezd
//
//  Created by WebUser on 17/4/6.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import <MyLayout/MyLayout.h>

@interface SearchViewLayout : MyRelativeLayout

@property(nonatomic, copy) void(^locationBlock)(NSString *cid, NSString *cname);
@property(nonatomic, copy) void(^searchBlock)(NSString *content);

@end
