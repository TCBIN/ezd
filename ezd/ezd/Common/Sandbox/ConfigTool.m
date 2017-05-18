//
//  ConfigTool.m
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "ConfigTool.h"

@implementation ConfigTool

SingletonClassM(Tool)

/**
 *  将数据存储到轻存储
 */
-(void)saveUserConfigMsg:(NSString *)key value:(id)value
{
    //注意：对相同的Key赋值约等于一次覆盖，要保证每一个Key的唯一性
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

/**
 *  读取轻存储数据
 */
-(id)readUserConfigMsg:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id result = [defaults objectForKey:key];
    if (result!=nil) {
        return result;
    }
    return nil;
}

/**
 *  根据key删除轻存储数据
 */
-(void)deleteUserConfigMsg:(NSString *)forKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:forKey];
    [defaults synchronize];
}

@end
