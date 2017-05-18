//
//  DisplayViewLayout.h
//  ezd
//
//  Created by WebUser on 17/4/7.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import <MyLayout/MyLayout.h>

@interface DisplayViewLayout : MyRelativeLayout

@property(nonatomic, strong) UITableView      *displayTableView;

@property(nonatomic, strong) NSMutableArray   *displayArray;

@end
