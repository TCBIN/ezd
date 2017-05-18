//
//  FilterViewLayout.m
//  ezd
//
//  Created by WebUser on 17/4/10.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import "FilterViewLayout.h"
#import "AppDelegate.h"

@interface FilterViewLayout ()
{
    //标题
    UILabel *_priceTitle;
    UILabel *_typeTitle;
    UILabel *_dayTitle;
    UILabel *_timeTitle;
    UILabel *_numberTitle;
    UILabel *_flagTitle;
}

@property(nonatomic, strong) MyRelativeLayout *typeLayout;

@end

@implementation FilterViewLayout

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = RGBA(0, 0, 0, 0.3);
        MyRelativeLayout *rootLeftLayout = [[MyRelativeLayout alloc] init];
        rootLeftLayout.leftPos.equalTo(self.leftPos);
        rootLeftLayout.myTopMargin = rootLeftLayout.myBottomMargin = 0;
        rootLeftLayout.rightPos.equalTo(self.rightPos).offset(kScreenWidth/4*3);
        rootLeftLayout.backgroundColor = [UIColor clearColor];
        [rootLeftLayout addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelPopageClick)]];
        [self addSubview:rootLeftLayout];
        
        MyRelativeLayout *rootLayout = [[MyRelativeLayout alloc] init];
        rootLayout.leftPos.equalTo(self.leftPos).offset(kScreenWidth/4);
        rootLayout.myTopMargin = rootLayout.myBottomMargin = 0;
        rootLayout.rightPos.equalTo(self.rightPos);
        rootLayout.backgroundColor = [UIColor whiteColor];
        [rootLayout addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditingClick)]];
        [self addSubview:rootLayout];
        
       
        MyRelativeLayout *bottomLayout = [[MyRelativeLayout alloc] init];
        bottomLayout.leftPos.equalTo(rootLayout.leftPos);
        bottomLayout.rightPos.equalTo(rootLayout.rightPos);
        bottomLayout.bottomPos.equalTo(rootLayout.bottomPos);
        bottomLayout.myHeight = 60;
        [rootLayout addSubview:bottomLayout];
        
        MyBorderLineDraw *topLineDraw = [[MyBorderLineDraw alloc] initWithColor:kFilterTitleColor];
        bottomLayout.topBorderLine = topLineDraw;
        
        UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [resetButton setTitle:@"重置" forState:UIControlStateNormal];
        [resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        resetButton.titleLabel.font = [UIFont systemFontOfSize:kTSize13];
        resetButton.backgroundColor = [UIColor blackColor];
        kViewRadius(resetButton, 5.0);
        [bottomLayout addSubview:resetButton];
        
        
        UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        sureButton.titleLabel.font = [UIFont systemFontOfSize:kTSize13];
        sureButton.backgroundColor = [UIColor redColor];
        kViewRadius(sureButton, 5.0);
        [bottomLayout addSubview:sureButton];
        
        resetButton.leftPos.equalTo(bottomLayout.leftPos).offset(5);
        resetButton.topPos.equalTo(bottomLayout.topPos).offset(5);
        resetButton.myHeight = 30;
        resetButton.widthDime.equalTo(bottomLayout.widthDime).multiply(0.4);
        
        sureButton.rightPos.equalTo(bottomLayout.rightPos).offset(5);
        sureButton.topPos.equalTo(bottomLayout.topPos).offset(5);
        sureButton.myHeight = 30;
        sureButton.leftPos.equalTo(resetButton.rightPos).offset(5);
        
        
        
        UIScrollView *rootScroll = [[UIScrollView alloc] init];
        rootScroll.contentSize = CGSizeMake(kScreenWidth/4*3, 700);
        rootScroll.scrollEnabled = YES;
        [rootLayout addSubview:rootScroll];
        rootScroll.leftPos.equalTo(rootLayout.leftPos);
        rootScroll.rightPos.equalTo(rootLayout.rightPos);
        rootScroll.topPos.equalTo(rootLayout.topPos);
        rootScroll.bottomPos.equalTo(bottomLayout.topPos);
        
        //显示所有条件标题
        [self showFilerTitle:rootScroll withBottomLayout:bottomLayout];
        //显示价格区间条件下具体内容
        [self showFilterPriceContent:rootScroll];
        //显示类型条件下具体内容
        [self showFilterTypeContent:rootScroll];
        //显示便民日条件下具体内容
        [self showFilerDayContent:rootScroll];
        //显示入住时间条件下具体内容
        [self showFilerTimeContent:rootScroll];
        //显示户数条件下具体内容
        [self showFilerNumberContent:rootScroll];
        //显示标签条件下具体内容
        [self showFilerFlagContent:rootScroll];
    }
    return self;
}

#pragma mark -  action
- (void)cancelPopageClick {
    [self endEditing:YES];
    [self showFilterView:self isShow:NO];
}
- (void)endEditingClick {
    [self endEditing:YES];
}
- (void)backRootLayout:(UIButton *)sender {
    [self.typeLayout removeFromSuperview];
}

- (void)typeSelectClick:(UIButton *)sender {
    [self endEditing:YES];
    if (sender.tag==1) {
        [self showTypeLayoutTitle:kFilterTypeAreaText dataArray:nil];
    }else if (sender.tag==2) {
        [self showTypeLayoutTitle:kFilterTypeBusinessText dataArray:nil];
    }else if (sender.tag==3) {
        [self showTypeLayoutTitle:kFilterTypePropertyText dataArray:nil];
    }
}



#pragma mark -  公共方法
- (void)showFilterView:(UIView *)view isShow:(BOOL)isShow {
    if (isShow) {
        [kApplicationDelegate.window addSubview:view];
        [UIView animateWithDuration:0.5 animations:^{
            view.frame = CGRectMake(0, 20, kScreenWidth, kScreenHeight);
        } completion:^(BOOL finished) {
            
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            view.frame = CGRectMake(kScreenWidth, 20, kScreenWidth, kScreenHeight);
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
    }
}

#pragma mark - 私有方法
- (void)showFilerTitle:(UIScrollView *)rootScroll withBottomLayout:(MyRelativeLayout *)bottomLayout {
    
    
    _priceTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, kScreenWidth/4*3-5, 25)];
    _priceTitle.text = kFilterPriceTitleText;
    _priceTitle.textColor = kFilterTitleColor;
    _priceTitle.font = [UIFont systemFontOfSize:kTSize12];
    [rootScroll addSubview:_priceTitle];
    
    _typeTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_priceTitle.frame)+35, CGRectGetWidth(_priceTitle.frame), CGRectGetHeight(_priceTitle.frame))];
    _typeTitle.text = kFilterTypeTitleText;
    _typeTitle.textColor = kFilterTitleColor;
    _typeTitle.font = [UIFont systemFontOfSize:kTSize12];
    [rootScroll addSubview:_typeTitle];
    
    _dayTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_typeTitle.frame)+75, CGRectGetWidth(_typeTitle.frame), CGRectGetHeight(_typeTitle.frame))];
    _dayTitle.text = kFilterDayTitleText;
    _dayTitle.textColor = kFilterTitleColor;
    _dayTitle.font = [UIFont systemFontOfSize:kTSize12];
    [rootScroll addSubview:_dayTitle];
    
    _timeTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_dayTitle.frame)+140, CGRectGetWidth(_dayTitle.frame), CGRectGetHeight(_dayTitle.frame))];
    _timeTitle.text = kFilterTimeTitleText;
    _timeTitle.textColor = kFilterTitleColor;
    _timeTitle.font = [UIFont systemFontOfSize:kTSize12];
    [rootScroll addSubview:_timeTitle];
    
    _numberTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_timeTitle.frame)+35, CGRectGetWidth(_timeTitle.frame), CGRectGetHeight(_timeTitle.frame))];
    _numberTitle.text = kFilterNumberTitleText;
    _numberTitle.textColor = kFilterTitleColor;
    _numberTitle.font = [UIFont systemFontOfSize:kTSize12];
    [rootScroll addSubview:_numberTitle];
    
    _flagTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_numberTitle.frame)+140, CGRectGetWidth(_numberTitle.frame), CGRectGetHeight(_numberTitle.frame))];
    _flagTitle.text = kFilterFlagTitleText;
    _flagTitle.textColor = kFilterTitleColor;
    _flagTitle.font = [UIFont systemFontOfSize:kTSize12];
    [rootScroll addSubview:_flagTitle];
}
//价格区间
- (void)showFilterPriceContent:(UIScrollView *)rootScroll {
    UILabel *priceLine = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_priceTitle.frame)/2-2, CGRectGetMaxY(_priceTitle.frame), 4, 35)];
    priceLine.text = @"-";
    priceLine.textAlignment = NSTextAlignmentCenter;
    [rootScroll addSubview:priceLine];
    
    UITextField *priceMin = [[UITextField alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_priceTitle.frame)+4, CGRectGetWidth(_priceTitle.frame)/2-8, 27)];
    priceMin.placeholder = @"最低价";
    priceMin.keyboardType = UIKeyboardTypeDecimalPad;
    kViewRadius(priceMin, 5.0);
    priceMin.font = [UIFont systemFontOfSize:kTSize13];
    kViewBorder(priceMin, [UIColor lightGrayColor], 0.5);
    [rootScroll addSubview:priceMin];
    
    UITextField *priceMax = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(priceLine.frame)+3, CGRectGetMaxY(_priceTitle.frame)+4, CGRectGetWidth(_priceTitle.frame)/2-4, 27)];
    priceMax.placeholder = @"最高价";
    priceMax.keyboardType = UIKeyboardTypeDecimalPad;
    kViewRadius(priceMax, 5.0);
    priceMax.font = [UIFont systemFontOfSize:kTSize13];
    kViewBorder(priceMax, [UIColor lightGrayColor], 0.5);
    [rootScroll addSubview:priceMax];
    
    
}
//类型
- (void)showFilterTypeContent:(UIScrollView *)rootScroll {
    NSArray *titles = @[@"不限",@"小区",@"商圈",@"写字楼"];
    for (int i=0; i<titles.count; i++) {
        UIButton *typeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        typeButton.frame = CGRectMake(5+((CGRectGetWidth(_typeTitle.frame)-15)/3+5)*(i%3), CGRectGetMaxY(_typeTitle.frame)+7+(31*(i/3)), (CGRectGetWidth(_typeTitle.frame)-15)/3, 26);
        kViewBorder(typeButton, [UIColor redColor], 0.5);
        kViewRadius(typeButton, 5.0);
        typeButton.tag = i+1;
        [typeButton setTitle:titles[i] forState:UIControlStateNormal];
        typeButton.titleLabel.font = [UIFont systemFontOfSize:kTSize13];
        [typeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [rootScroll addSubview:typeButton];
    }
}
//便民日
- (void)showFilerDayContent:(UIScrollView *)rootScroll {
    
    NSArray *titles = @[@"不限",@"有",@"无"];
    for (int i=0; i<titles.count; i++) {
        UIButton *dayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        dayButton.frame = CGRectMake(5+((CGRectGetWidth(_dayTitle.frame)-15)/3+5)*(i%3), CGRectGetMaxY(_dayTitle.frame)+7+(31*(i/3)), (CGRectGetWidth(_dayTitle.frame)-15)/3, 26);
        kViewBorder(dayButton, [UIColor redColor], 0.5);
        kViewRadius(dayButton, 5.0);
        dayButton.tag = i+1;
        [dayButton setTitle:titles[i] forState:UIControlStateNormal];
        dayButton.titleLabel.font = [UIFont systemFontOfSize:kTSize13];
        [dayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [rootScroll addSubview:dayButton];
    }
    
    UILabel *areaLayout = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_dayTitle.frame)+40, CGRectGetWidth(_dayTitle.frame)-5, 30)];
    areaLayout.userInteractionEnabled = YES;
    areaLayout.text = kFilterTypeAreaText;
    areaLayout.font = [UIFont systemFontOfSize:kTSize13];
    [rootScroll addSubview:areaLayout];
    UIView *bottomAreaLine = [[UIView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(areaLayout.frame), CGRectGetWidth(areaLayout.frame), 0.5)];
    bottomAreaLine.backgroundColor = kFilterTitleColor;
    [rootScroll addSubview:bottomAreaLine];
    
    UILabel *areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, CGRectGetWidth(areaLayout.frame)-55, CGRectGetHeight(areaLayout.frame))];
    areaLabel.text = kFilterTypeSelectText;
    areaLabel.font = [UIFont systemFontOfSize:kTSize13];
    areaLabel.textColor = [UIColor orangeColor];
    areaLabel.textAlignment = NSTextAlignmentRight;
    [areaLayout addSubview:areaLabel];
    UIButton *areaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    areaButton.frame = CGRectMake(40, 0, CGRectGetWidth(areaLayout.frame)-40, CGRectGetHeight(areaLayout.frame));
    [areaButton setImage:[UIImage imageNamed:kFilterRightImage] forState:UIControlStateNormal];
    areaButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [areaButton setImageEdgeInsets:UIEdgeInsetsMake(0, areaButton.bounds.size.width-15, 0, 0)];
    areaButton.tag = 1;
    [areaButton addTarget:self action:@selector(typeSelectClick:) forControlEvents:UIControlEventTouchUpInside];
    [areaLayout addSubview:areaButton];
    
    
    UILabel *businessLayout = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(areaLayout.frame), CGRectGetWidth(areaLayout.frame), CGRectGetHeight(areaLayout.frame))];
    businessLayout.userInteractionEnabled = YES;
    businessLayout.text = kFilterTypeBusinessText;
    businessLayout.font = [UIFont systemFontOfSize:kTSize13];
    [rootScroll addSubview:businessLayout];
    UIView *bottomBusinessLine = [[UIView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(businessLayout.frame), CGRectGetWidth(businessLayout.frame), 0.5)];
    bottomBusinessLine.backgroundColor = kFilterTitleColor;
    [rootScroll addSubview:bottomBusinessLine];
    
    UILabel *businessLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, CGRectGetWidth(businessLayout.frame)-55, CGRectGetHeight(businessLayout.frame))];
    businessLabel.text = kFilterTypeSelectText;
    businessLabel.font = [UIFont systemFontOfSize:kTSize13];
    businessLabel.textColor = [UIColor orangeColor];
    businessLabel.textAlignment = NSTextAlignmentRight;
    [businessLayout addSubview:businessLabel];
    UIButton *businessButton = [UIButton buttonWithType:UIButtonTypeCustom];
    businessButton.frame = CGRectMake(40, 0, CGRectGetWidth(businessLayout.frame)-40, CGRectGetHeight(businessLayout.frame));
    [businessButton setImage:[UIImage imageNamed:kFilterRightImage] forState:UIControlStateNormal];
    businessButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [businessButton setImageEdgeInsets:UIEdgeInsetsMake(0, businessButton.bounds.size.width-15, 0, 0)];
    businessButton.tag = 2;
    [businessButton addTarget:self action:@selector(typeSelectClick:) forControlEvents:UIControlEventTouchUpInside];
    [businessLayout addSubview:businessButton];
    
    UILabel *propertyLayout = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(businessLayout.frame), CGRectGetWidth(businessLayout.frame), CGRectGetHeight(businessLayout.frame))];
    propertyLayout.userInteractionEnabled = YES;
    propertyLayout.text = kFilterTypePropertyText;
    propertyLayout.font = [UIFont systemFontOfSize:kTSize13];
    [rootScroll addSubview:propertyLayout];
    UIView *bottomPropertyLine = [[UIView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(propertyLayout.frame), CGRectGetWidth(propertyLayout.frame), 0.5)];
    bottomPropertyLine.backgroundColor = kFilterTitleColor;
    [rootScroll addSubview:bottomPropertyLine];
    
    UILabel *propertyLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, CGRectGetWidth(propertyLayout.frame)-55, CGRectGetHeight(propertyLayout.frame))];
    propertyLabel.text = kFilterTypeSelectText;
    propertyLabel.font = [UIFont systemFontOfSize:kTSize13];
    propertyLabel.textColor = [UIColor orangeColor];
    propertyLabel.textAlignment = NSTextAlignmentRight;
    [propertyLayout addSubview:propertyLabel];
    UIButton *propertyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    propertyButton.frame = CGRectMake(40, 0, CGRectGetWidth(propertyLayout.frame)-40, CGRectGetHeight(propertyLayout.frame));
    [propertyButton setImage:[UIImage imageNamed:kFilterRightImage] forState:UIControlStateNormal];
    propertyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [propertyButton setImageEdgeInsets:UIEdgeInsetsMake(0, propertyButton.bounds.size.width-15, 0, 0)];
    propertyButton.tag = 3;
    [propertyButton addTarget:self action:@selector(typeSelectClick:) forControlEvents:UIControlEventTouchUpInside];
    [propertyLayout addSubview:propertyButton];
    
}
//便民日的请选择
- (void)showTypeLayoutTitle:(NSString *)title dataArray:(NSArray *)dataArray {
    MyRelativeLayout *typeLayout = [[MyRelativeLayout alloc] init];
    
    typeLayout.leftPos.equalTo(self.leftPos).offset(kScreenWidth/4);
    typeLayout.myTopMargin = typeLayout.myBottomMargin = 0;
    typeLayout.rightPos.equalTo(self.rightPos);
    typeLayout.backgroundColor = [UIColor whiteColor];
    [self addSubview:typeLayout];
    [self bringSubviewToFront:typeLayout];
    self.typeLayout = typeLayout;
    
    MyRelativeLayout *topLayout = [[MyRelativeLayout alloc] init];
    topLayout.leftPos.equalTo(typeLayout.leftPos);
    topLayout.rightPos.equalTo(typeLayout.rightPos);
    topLayout.topPos.equalTo(typeLayout.topPos);
    topLayout.myHeight = 35;
    [typeLayout addSubview:topLayout];
    topLayout.backgroundColor = RGB(217, 217, 217);
    
    UILabel *topTitle = [[UILabel alloc] init];
    topTitle.text = title;
    topTitle.textColor = [UIColor blackColor];
    topTitle.font = [UIFont systemFontOfSize:kTSize13];
    topTitle.textAlignment = NSTextAlignmentCenter;
    [topLayout addSubview:topTitle];
    topTitle.centerYPos.equalTo(topLayout.centerYPos);
    topTitle.centerXPos.equalTo(topLayout.centerXPos);
    topTitle.heightDime.equalTo(topLayout.heightDime);
    topTitle.widthDime.equalTo(topLayout.widthDime).multiply(0.5);
    
    UIButton *backTop = [UIButton buttonWithType:UIButtonTypeCustom];
    [backTop setImage:[UIImage imageNamed:kFilterBackImage] forState:UIControlStateNormal];
    [backTop addTarget:self action:@selector(backRootLayout:) forControlEvents:UIControlEventTouchUpInside];
    [topLayout addSubview:backTop];
    backTop.centerYPos.equalTo(topLayout.centerYPos);
    backTop.heightDime.equalTo(topLayout.heightDime);
    backTop.widthDime.equalTo(topLayout.heightDime);
    backTop.leftPos.equalTo(topLayout.leftPos);
}
//入住时间
- (void)showFilerTimeContent:(UIScrollView *)rootScroll {
    UILabel *timeMinLine = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_timeTitle.frame)/2-20, CGRectGetMaxY(_timeTitle.frame), 20, 35)];
    timeMinLine.text = @"年-";
    timeMinLine.font = [UIFont systemFontOfSize:kTSize13];
    timeMinLine.textAlignment = NSTextAlignmentCenter;
    [rootScroll addSubview:timeMinLine];
    
    UITextField *timeMin = [[UITextField alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_timeTitle.frame)+4, (CGRectGetWidth(_timeTitle.frame)-40)/2-5, 27)];
    kViewRadius(timeMin, 5.0);
    timeMin.keyboardType = UIKeyboardTypeDecimalPad;
    timeMin.font = [UIFont systemFontOfSize:kTSize13];
    kViewBorder(timeMin, [UIColor lightGrayColor], 0.5);
    [rootScroll addSubview:timeMin];
    
    UITextField *timeMax = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(timeMinLine.frame), CGRectGetMaxY(_timeTitle.frame)+4, (CGRectGetWidth(_timeTitle.frame)-40)/2, 27)];
    kViewRadius(timeMax, 5.0);
    timeMax.keyboardType = UIKeyboardTypeDecimalPad;
    timeMax.font = [UIFont systemFontOfSize:kTSize13];
    kViewBorder(timeMax, [UIColor lightGrayColor], 0.5);
    [rootScroll addSubview:timeMax];
    
    UILabel *timeMaxLine = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(timeMax.frame), CGRectGetMaxY(_timeTitle.frame), 20, 35)];
    timeMaxLine.text = @"年";
    timeMaxLine.font = [UIFont systemFontOfSize:kTSize13];
    timeMaxLine.textAlignment = NSTextAlignmentCenter;
    [rootScroll addSubview:timeMaxLine];
}
//户数
- (void)showFilerNumberContent:(UIScrollView *)rootScroll {
    NSArray *titles = @[@"不限",@"0-100户",@"100-200户",@"200-300户",@"300-500户",@"500-1000户",@"1000户以上"];
    for (int i=0; i<titles.count; i++) {
        UIButton *numberButton = [UIButton buttonWithType:UIButtonTypeCustom];
        numberButton.frame = CGRectMake(5+((CGRectGetWidth(_numberTitle.frame)-10)/2+5)*(i%2), CGRectGetMaxY(_numberTitle.frame)+7+(31*(i/2)), (CGRectGetWidth(_numberTitle.frame)-10)/2, 26);
        kViewBorder(numberButton, [UIColor redColor], 0.5);
        kViewRadius(numberButton, 5.0);
        numberButton.tag = i+1;
        [numberButton setTitle:titles[i] forState:UIControlStateNormal];
        numberButton.titleLabel.font = [UIFont systemFontOfSize:kTSize13];
        [numberButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [rootScroll addSubview:numberButton];
    }
}
//标签
- (void)showFilerFlagContent:(UIScrollView *)rootScroll {
    NSArray *titles = @[@"不限",@"是否供电",@"提供桌椅",@"提供帐篷",@"物业可过夜",@"可发传单",@"有车位",@"车位收费",@"展地室内"];
    for (int i=0; i<titles.count; i++) {
        UIButton *flagButton = [UIButton buttonWithType:UIButtonTypeCustom];
        flagButton.frame = CGRectMake(5+((CGRectGetWidth(_flagTitle.frame)-15)/3+5)*(i%3), CGRectGetMaxY(_flagTitle.frame)+7+(31*(i/3)), (CGRectGetWidth(_flagTitle.frame)-15)/3, 26);
        kViewBorder(flagButton, [UIColor redColor], 0.5);
        kViewRadius(flagButton, 5.0);
        flagButton.tag = i+1;
        [flagButton setTitle:titles[i] forState:UIControlStateNormal];
        flagButton.titleLabel.font = [UIFont systemFontOfSize:kTSize13];
        [flagButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [rootScroll addSubview:flagButton];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
