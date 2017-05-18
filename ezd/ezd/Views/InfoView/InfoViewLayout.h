//
//  InfoViewLayout.h
//  ezd
//
//  Created by WebUser on 17/4/10.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import <MyLayout/MyLayout.h>

@interface InfoViewLayout : MyRelativeLayout

@property(nonatomic, strong) UITableView      *infoTableView;

@property(nonatomic, strong) NSMutableArray   *infoArray;

@end
