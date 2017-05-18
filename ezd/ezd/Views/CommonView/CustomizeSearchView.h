//
//  CustomizeSearchView.h
//  ezd
//
//  Created by WebUser on 17/4/6.
//  Copyright © 2017年 tigo. All rights reserved.
//


typedef void(^SearchButtonClickBlock)(NSString *searchContent);

@interface CustomizeSearchView : MyRelativeLayout

+(instancetype)customizeSearchView;

-(void)setupIcon:(NSString *)iconName placeholder:(NSString *)placeholderMessage searchBg:(NSString *)searchbgName;

@property(nonatomic, copy) SearchButtonClickBlock searchClickBlock;

@end
