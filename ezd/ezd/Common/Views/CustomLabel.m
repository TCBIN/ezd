//
//  CustomLabel.m
//  EstateClient
//
//  Created by VictorTu on 16/9/6.
//  Copyright © 2016年 Tigo. All rights reserved.
//

#import "CustomLabel.h"

@implementation CustomLabel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}

@end
