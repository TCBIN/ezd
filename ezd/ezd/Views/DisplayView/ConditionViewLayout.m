//
//  ConditionViewLayout.m
//  ezd
//
//  Created by WebUser on 17/4/10.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import "ConditionViewLayout.h"

@interface ConditionViewLayout ()

@property(nonatomic, strong) UIButton *smartSortBtn;
@property(nonatomic, strong) UIButton *salesNumberBtn;
@property(nonatomic, strong) UIButton *priceValueBtn;

@property(nonatomic, strong) UIButton *filterCditBtn;


@end

@implementation ConditionViewLayout

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        MyBorderLineDraw *lineTopDraw = [[MyBorderLineDraw alloc] initWithColor:[UIColor lightGrayColor]];
        lineTopDraw.dash = 0;
        self.topBorderLine = lineTopDraw;
        [self addSubview:self.smartSortBtn];
        [self addSubview:self.salesNumberBtn];
        [self addSubview:self.priceValueBtn];
        [self addSubview:self.filterCditBtn];
        
        self.smartSortBtn.leftPos.equalTo(self.leftPos);
        self.smartSortBtn.centerYPos.equalTo(self.centerYPos);
        self.smartSortBtn.widthDime.equalTo(self.widthDime).multiply(0.25);
        self.smartSortBtn.heightDime.equalTo(self.heightDime);
        
        self.salesNumberBtn.leftPos.equalTo(self.smartSortBtn.rightPos);
        self.salesNumberBtn.centerYPos.equalTo(self.centerYPos);
        self.salesNumberBtn.widthDime.equalTo(self.smartSortBtn.widthDime);
        self.salesNumberBtn.heightDime.equalTo(self.heightDime);
        
        self.priceValueBtn.leftPos.equalTo(self.salesNumberBtn.rightPos);
        self.priceValueBtn.centerYPos.equalTo(self.centerYPos);
        self.priceValueBtn.widthDime.equalTo(self.salesNumberBtn.widthDime);
        self.priceValueBtn.heightDime.equalTo(self.heightDime);
        
        self.filterCditBtn.leftPos.equalTo(self.priceValueBtn.rightPos);
        self.filterCditBtn.centerYPos.equalTo(self.centerYPos);
        self.filterCditBtn.widthDime.equalTo(self.priceValueBtn.widthDime);
        self.filterCditBtn.heightDime.equalTo(self.heightDime);

    }
    return self;
}


#pragma mark - action
- (void)smartSortBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}
- (void)salesNumberBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}
- (void)priceValueBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}
- (void)filterBtnClick:(UIButton *)sender {
    
    kNSLog(@"点击");
//    [sender setSelected:!sender.isSelected];
    if (self.filterBlock) {
        self.filterBlock(sender.isSelected);
    }
}

#pragma mark  - 创建布局
- (void)createLayout {
    
}

- (UIButton *)smartSortBtn {
    if (!_smartSortBtn) {
        _smartSortBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_smartSortBtn setTitle:kDisplayCondition1Text forState:UIControlStateNormal];
        _smartSortBtn.titleLabel.font = [UIFont systemFontOfSize:kTSize13];
        [_smartSortBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_smartSortBtn addTarget:self action:@selector(smartSortBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _smartSortBtn;
}
- (UIButton *)salesNumberBtn {
    if (!_salesNumberBtn) {
        _salesNumberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_salesNumberBtn setTitle:kDisplayCondition2Text forState:UIControlStateNormal];
        _salesNumberBtn.titleLabel.font = [UIFont systemFontOfSize:kTSize13];
        [_salesNumberBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_salesNumberBtn addTarget:self action:@selector(salesNumberBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _salesNumberBtn;
}
- (UIButton *)priceValueBtn {
    if (!_priceValueBtn) {
        _priceValueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_priceValueBtn setTitle:kDisplayCondition3Text forState:UIControlStateNormal];
        _priceValueBtn.titleLabel.font = [UIFont systemFontOfSize:kTSize13];
        [_priceValueBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_priceValueBtn addTarget:self action:@selector(priceValueBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _priceValueBtn;
}
- (UIButton *)filterCditBtn {
    if (!_filterCditBtn) {
        _filterCditBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_filterCditBtn setTitle:kDisplayCondition4Text forState:UIControlStateNormal];
        _filterCditBtn.titleLabel.font = [UIFont systemFontOfSize:kTSize13];
        [_filterCditBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_filterCditBtn addTarget:self action:@selector(filterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _filterCditBtn;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
