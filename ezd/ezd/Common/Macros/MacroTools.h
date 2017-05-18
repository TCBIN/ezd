//
//  MacroTools.h
//  VictorOC
//
//  Created by WebUser on 17/3/1.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#ifndef MacroTools_h
#define MacroTools_h

#pragma mark -- 打印
//#ifdef DEBUG // 调试状态, 打开LOG功能
//#define kNSLog(...) NSLog(__VA_ARGS__)
//#else // 发布状态, 关闭LOG功能
//#define kNSLog(...)
//#endif
//日志输出宏定义
#ifdef DEBUG
//调试状态
#define MyStringRow [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent
#define kNSLog(...) printf("\n%s 第%d行: %s\n",[MyStringRow UTF8String] ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
#else
//发布状态
#define kNSLog(...)
#endif

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define kApplicationDelegate                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define kAppNavigationController             (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController

#pragma mark - StatusBar NavBar TabBar

#define kNavBarHidden(hidden)                [self.navigationController setNavigationBarHidden:hidden];
#define kNavBarHeight                        self.navigationController.navigationBar.bounds.size.height
#define kStatusBarHeight                     20
#define kTabBarHeight                        self.tabBarController.tabBar.bounds.size.height

/**导航push动画*/
//CA_EXTERN NSString * const kCATransitionFromRight
//CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
//CA_EXTERN NSString * const kCATransitionFromLeft
//CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
//CA_EXTERN NSString * const kCATransitionFromTop
//CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
//CA_EXTERN NSString * const kCATransitionFromBottom
//CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
#define kStartNavAnimation(kCATransitionFromDirection)\
\
CATransition *tran = [CATransition animation];\
tran.duration =.5;\
tran.type = kCATransitionPush;\
tran.subtype = kCATransitionFromDirection;\
[self.navigationController.view.layer addAnimation:tran forKey:nil];

#pragma mark - 屏幕尺寸
#define kScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define kSelfViewWidth                       self.view.bounds.size.width
#define kSelfViewHeight                      self.view.bounds.size.height
#define SpaceW(w)                            w/2.0/375.0*kScreenWidth
#define SpaceH(h)                            h/2.0/667.0*kScreenHeight
#define kUseViewScreenHeight                 kScreenHeight - kNavBarHeight - 20 //view高度
//设计图与运行设备比例 （设计图大小为 750*1134）可更改
#define WidthProportion                      (kScreenWidth / 750)
#define HeightProportion                     (kScreenHeight / 1134)

#define kNSStringFormat(string, args...)    [NSString stringWithFormat:string, args]
#define NSNumberWithBool(b)                 [NSNumber numberWithBool:b]


#define ERROR(m,c,d) [NSError errorWithDomain:m code:c userInfo:d]

#define kAppVersion                         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAppName                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kDeviceMode                         [[UIDevice currentDevice] model]


//  DEVICE DETECTION detection
#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)
#define IS_IPHONE (!IS_IPAD)
#define IS_IPHONE_5 ( IS_IPHONE && IS_WIDESCREEN )
#pragma mark - 设备 4、5、6……
#define kIphone45       ([[UIScreen mainScreen] bounds].size.width  == 320.f)
#define kIphone4        ([[UIScreen mainScreen] bounds].size.height == 480.f)
#define kIphone5        ([[UIScreen mainScreen] bounds].size.height == 568.f)
#define kIphone6        ([[UIScreen mainScreen] bounds].size.height == 667.f)
#define kIphone6p       ([[UIScreen mainScreen] bounds].size.height == 736.f)


#pragma mark - 设备版本
//设备版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define kIOS7 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define kIOS8 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

#pragma mark - 打开URL
//打开URL
#define kOpenURL(urlString)                 [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:urlString]]
#pragma mark - 国际化
//国际化
#define D_LocalizedCardString(s)            [[NSBundle mainBundle] localizedStringForKey:s value:nil table:@"Localizable"]
//颜色
#define RGB(r, g, b)                        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kUIColorFromRGB(rgbValue)           [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#pragma mark -  ALERT弹框
//ALERT弹框
#define ALERT(title, msg)                            [[[UIAlertView alloc]initWithTitle:title\
message:msg\
delegate:nil\
cancelButtonTitle:@"OK"\
otherButtonTitles:nil] show]
#pragma mark -  View 圆角
//View 圆角
#define kViewRadius(View, Radius)                    [View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

#pragma mark -   View加边框
//View加边框
#define kViewBorder(View, BorderColor, BorderWidth ) View.layer.borderColor = BorderColor.CGColor;\
View.layer.borderWidth = BorderWidth;
#pragma mark -   View加偏移量
//View加偏移量
#define kViewShadow(View, ShadowColor, ShadowCGSize) View.layer.shadowColor = ShadowColor.CGColor;\
View.layer.shadowOffset = ShadowCGSize;\
View.layer.shadowOpacity = YES;

#endif /* MacroTools_h */
