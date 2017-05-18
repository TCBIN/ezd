//
//  CommonTabBarController.m
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "CommonTabBarController.h"
#import "CommonNavController.h"
#import "CommonCustomTabBar.h"

#import "HomeViewController.h"
#import "DisplayViewController.h"
#import "InfoViewController.h"
#import "MyViewController.h"

@interface CommonTabBarController ()

@property(nonatomic, weak) HomeViewController     *homeView;
@property(nonatomic, weak) DisplayViewController  *displayView;
@property(nonatomic, weak) InfoViewController     *infoView;
@property(nonatomic, weak) MyViewController       *myView;

@end

@implementation CommonTabBarController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)init
{
    self = [super init];
    if (self) {
        [self setRestorationIdentifier:@"CommonTabBarControllerKey"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化TabBatController
    [self initTabBatController];
    //创建自定义tabbar
//    [self addCustomTabBar];
    //判断首选展示的Item
//    [self setupSelectedItemIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+(instancetype)initCommonTabBarController
{
    return [[self alloc] init];
}

/**
 *  创建自定义tabbar
 */
-(void)addCustomTabBar
{
    CommonCustomTabBar *cusTabBar = [[CommonCustomTabBar alloc] init];
    //更换系统自带的tabbar
    //    cusTabBar.backgroundColor = [UIColor blackColor];
    [self setValue:cusTabBar forKey:@"tabBar"];
}



/**
 *  初始化TabBatController
 */
-(void)initTabBatController
{
    HomeViewController *homeView = [[HomeViewController alloc] init];
    [self addChildTabItem:homeView title:kBaseTabBarHomeText imageName:kBaseTabBarHomeImageN selectedImageName:kBaseTabBarHomeImageP];
    self.homeView = homeView;

    DisplayViewController *displayView = [[DisplayViewController alloc] init];
    [self addChildTabItem:displayView title:kBaseTabBarDisplayText imageName:kBaseTabBarHomeImageN selectedImageName:kBaseTabBarHomeImageP];
    self.displayView = displayView;
    
    InfoViewController *infoView = [[InfoViewController alloc] init];
    [self addChildTabItem:infoView title:kBaseTabBarInfoText imageName:kBaseTabBarInfoImageN selectedImageName:kBaseTabBarInfoImageP];
    self.infoView = infoView;
    
    MyViewController *myView = [[MyViewController alloc] init];
    [self addChildTabItem:myView title:kBaseTabBarMyText imageName:kBaseTabBarMyImageN selectedImageName:kBaseTabBarMyImageP];
    self.myView = myView;

}

- (void)messageViewBadgeValue:(NSNotification*)noti
{
}

//-(void)updateMessageData:(NSMutableArray *)conversationArray lastMessage:(EMMessage *)lastMessage latestMessageTitle:(NSString *)latestMessageTitle
//{
//    
//}


/**
 *  添加tabBar子控制器
 *
 *  @param childVC           子控制器对象
 *  @param title             标题
 *  @param imageName         未选中图标名称
 *  @param selectedImageName 选中图标名称
 */
-(void)addChildTabItem:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //设置标题
    //childVC.title = title;
    childVC.tabBarItem.title = title;
    UIImage *image = [UIImage imageNamed:selectedImageName];
    if ([title isEqualToString:kBaseTabBarCustomText]) {
        //禁止图片渲染
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    //设置控件未选中图标
    childVC.tabBarItem.image = image;
    
    
    //设置字体普通状态颜色
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    [childVC.tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    [childVC.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    //设置控件选中图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    //禁止图片渲染
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = selectedImage;
    
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:kBaseTabBarColor];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:kBaseTabBarTopLineImage]];
    //添加导航控制器
    CommonNavController *commonNavigation = [[CommonNavController alloc] initWithRootViewController:childVC];
    [self addChildViewController:commonNavigation];
}

/**
 *  设置展示那个页面
 */
//-(void)setupSelectedItemIndex
//{
//
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
