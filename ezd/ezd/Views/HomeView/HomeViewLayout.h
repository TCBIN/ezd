//
//  HomeViewLayout.h
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import <MyLayout/MyLayout.h>

@interface HomeViewLayout : MyRelativeLayout

@property(nonatomic, strong) UITableView      *homeTableView;

@property(nonatomic, strong) NSMutableArray   *homeArray;

@end
