//
//  CommonCustomTabBar.h
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommonCustomTabBar;

@protocol CommonCustomTabBarDelegate <NSObject>

@optional

- (void)tabBarDidClickedPlusButton:(CommonCustomTabBar *)tabBar;

@end

/**
 *  自定义TabBar
 */
@interface CommonCustomTabBar : UITabBar

@property (nonatomic, weak) id<CommonCustomTabBarDelegate> tabBarDelegate;

@end
