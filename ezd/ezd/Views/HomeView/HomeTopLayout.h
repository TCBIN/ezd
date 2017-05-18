//
//  HomeTopLayout.h
//  ezd
//
//  Created by WebUser on 17/4/7.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import <MyLayout/MyLayout.h>
#import "SDCycleScrollView.h"

typedef void(^CycleScrollViewClickBlock)(SDCycleScrollView *cycleScrollView,NSInteger index);

@interface HomeTopLayout : MyRelativeLayout

@property(nonatomic, strong, readonly) SDCycleScrollView *imagePlayView;


@property(nonatomic, strong) NSArray *childImageModel;


@property(nonatomic, copy) CycleScrollViewClickBlock cycleScrollClickBlock;

/**开启轮播广告*/
-(void)onStartPlayImage;

/**关闭轮播广告*/
-(void)onStopPlayImage;

@end
