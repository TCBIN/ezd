//
//  CommonCustomTabBar.m
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "CommonCustomTabBar.h"

@implementation CommonCustomTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加透明背景
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    // 设置所有tabbarButton的frame
    [self setupAllTabBarButtonsFrame];
}

/**
 *  设置所有tabbarButton的frame
 */
-(void)setupAllTabBarButtonsFrame
{
    int index = 0;
    for (UIView *tabBarButton in self.subviews) {
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])continue;
        [self setupTabBarButtonFrame:tabBarButton atIndex:index];
        index++;
    }
}

-(void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
{
    CGFloat bottonW = self.width / self.items.count;
    CGFloat bottonH = self.height;
    tabBarButton.width = bottonW;
    tabBarButton.x = bottonW * index;
    tabBarButton.height = bottonH+(bottonW-bottonH);
    if (index != 2) {
        tabBarButton.height = bottonH;
        tabBarButton.y = 0;
    }else{
        tabBarButton.height = bottonH+bottonH/2;
        tabBarButton.y = -bottonH/2;
    }
}


@end
