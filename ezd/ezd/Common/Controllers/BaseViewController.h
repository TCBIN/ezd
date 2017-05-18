//
//  BaseViewController.h
//  VictorOC
//
//  Created by WebUser on 17/3/1.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/** 根视图滚动 */
@property(nonatomic, strong) UIScrollView *baseScrollView;
/** 基础URL参数 */
@property(nonatomic, strong) NSDictionary *baseUrlParameter;

/** 是否登录 YES登录 NO未登录*/
-(BOOL)isLogin;
/** 设置滚动背景 */
- (void)setbackgroundScrollView;

@end
