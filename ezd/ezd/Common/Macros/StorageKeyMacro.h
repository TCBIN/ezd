//
//  StorageKeyMacro.h
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#ifndef StorageKeyMacro_h
#define StorageKeyMacro_h

#pragma mark -- 三方平台申请的key

#define kGtAppId @"wv3Fo8rIt18rYyL0f4sLx2"
#define kGtAppKey @"97k6kcPhSQABglxunVtb42"
#define kGtAppSecret @"JiYiIlAtil6yPhyLfztAU3"

#define hxAppKey @"tianwang#houseapp"
#define hxApnsCertName @"EstateClient"

#define ShareSDKAPPKey @"1c2cc9626bff8"
#define WXAppID @"wxe4d535875c799224"
#define WXAppSecret @"bcb8be87145b9f29072995450f2860a9"
#define BDAPPKey @"N0NQunr7o9ozhlVI5zqOkm347uQ6Zoyi"

/** 快速存储使用工具 */
#define kUserDefaults             [NSUserDefaults standardUserDefaults]
#define kDocumentsPath            [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0]

#define kSaveConfig               [ConfigTool sharedTool]
#define kReadUserConfig(key)      [[ConfigTool sharedTool] readUserConfigMsg:key]
#define kDeleteUserConfig(key)    [[ConfigTool sharedTool] deleteUserConfigMsg:key]


/**
 * 用户信息
 *
 * 用来保存用户所有信息，以及用户常用的个别信息
 */
#define kUserId                 @"kUserIdKey"
#define kUserToken              @"kUserTokenKey"
#define kUserModel              @"kUserModelKey"

/**
 * 推送信息
 *
 * 用来保存设备的推送信息（包括本地推送，服务器推送，三方推送）
 */
#define kUserPushModel          @"kUserPushModelKey"
/**
 * 逻辑信息
 *
 * 在操作程序过程中，保存程序的临时数据，以及标记
 */


#endif /* StorageKeyMacro_h */
