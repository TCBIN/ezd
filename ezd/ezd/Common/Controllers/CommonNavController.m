//
//  CommonNavController.m
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "CommonNavController.h"

@interface CommonNavController ()

@end

@implementation CommonNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏图标颜色
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    //隐藏返回按钮文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    //设置标题颜色
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor blackColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:21], NSFontAttributeName, nil]];
    //设置导航栏背景颜色
    [[UINavigationBar appearance] setBarTintColor:kBaseNavColor];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    //设置电量条状态颜色
    return UIStatusBarStyleDefault;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    [super pushViewController:viewController animated:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
