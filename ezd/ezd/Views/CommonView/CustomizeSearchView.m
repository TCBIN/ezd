//
//  CustomizeSearchView.m
//  ezd
//
//  Created by WebUser on 17/4/6.
//  Copyright © 2017年 tigo. All rights reserved.
//
//

#import "CustomizeSearchView.h"

@interface CustomizeSearchView()<UITextFieldDelegate>

@property(nonatomic, strong) UIImageView  *iconImageView;
@property(nonatomic, strong) UITextField  *textField;
@property(nonatomic, strong) UIButton     *searchButton;

@end

@implementation CustomizeSearchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        MyRelativeLayout *textFileLayout = [[MyRelativeLayout alloc] init];
        textFileLayout.padding = UIEdgeInsetsMake(1, 1, 1, 1);
        kViewBorder(textFileLayout, [UIColor redColor], 0.5);
        textFileLayout.backgroundColor = [UIColor whiteColor];
        [self addSubview:textFileLayout];
        [textFileLayout addSubview:self.iconImageView];
        [textFileLayout addSubview:self.textField];
        [self addSubview:self.searchButton];
        
        //设置布局属性
        textFileLayout.heightDime.equalTo(self.heightDime);
        textFileLayout.leftPos.equalTo(self.leftPos);
        textFileLayout.rightPos.equalTo(self.searchButton.leftPos).offset(-1);
        self.iconImageView.myWidth = 30;
        self.iconImageView.heightDime.equalTo(textFileLayout.heightDime);
        self.iconImageView.leftPos.equalTo(textFileLayout.leftPos);
        self.textField.heightDime.equalTo(textFileLayout.heightDime);
        self.textField.leftPos.equalTo(self.iconImageView.rightPos);
        self.textField.rightPos.equalTo(textFileLayout.rightPos);
        self.searchButton.topPos.equalTo(textFileLayout.topPos).offset(-0.5);
        self.searchButton.bottomPos.equalTo(textFileLayout.bottomPos).offset(-0.5);
        self.searchButton.myWidth = 40;
        self.searchButton.rightPos.equalTo(self.rightPos);
    }
    return self;
}

#pragma mark  -- action
-(void)searchButtonClick {
    if (self.searchClickBlock) {
        self.searchClickBlock(self.textField.text);
    }
    [self endTextFieldEditing];
}

#pragma mark -- 公共方法
+(instancetype)customizeSearchView
{
    return [[self alloc] init];
}

-(void)setupIcon:(NSString *)iconName placeholder:(NSString *)placeholderMessage searchBg:(NSString *)searchbgName
{
    if (iconName != nil && ![@"" isEqualToString:iconName]) {
        self.iconImageView.image = [UIImage imageNamed:iconName];
    }else{
       self.iconImageView.myWidth = 2;
    }
    if (placeholderMessage != nil && ![@"" isEqualToString:placeholderMessage]) {
        self.textField.placeholder = placeholderMessage;
    }
    if (searchbgName != nil && ![@"" isEqualToString:searchbgName]) {
        [self.searchButton setBackgroundImage:[UIImage imageNamed:searchbgName] forState:UIControlStateNormal];
    }
}

-(void)endTextFieldEditing
{
    [self.textField endEditing:YES];
}

#pragma mark -- 懒加载
-(UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeCenter;
    }
    return _iconImageView;
}

-(UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.font = [UIFont systemFontOfSize:kTSize13];
        _textField.paddingLeft = 3;
        _textField.paddingRight = 3;
        _textField.delegate = self;
    }
    return _textField;
}

-(UIButton *)searchButton
{
    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchButton setBackgroundImage:[UIImage imageNamed:kHomeSearchImage] forState:UIControlStateNormal];
        [_searchButton addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchButton;
}

@end
