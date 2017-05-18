//
//  ConfigTool.h
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletonClass.h"

@interface ConfigTool : NSObject

SingletonClassH(Tool)

/**轻存储存储数据*/
-(void)saveUserConfigMsg:(NSString *)key value:(id)value;

/**轻存储读取数据*/
-(id)readUserConfigMsg:(NSString *)key;

/**轻存储根据key删除某项*/
-(void)deleteUserConfigMsg:(NSString *)forKey;


@end
