//
//  HomeTopLayout.m
//  ezd
//
//  Created by WebUser on 17/4/7.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import "HomeTopLayout.h"

@interface HomeTopLayout ()<SDCycleScrollViewDelegate>

@property(nonatomic, strong) UIButton *moreDisplayBtn;
@property(nonatomic, strong) UIButton *convActivityBtn;
@property(nonatomic, strong) UIButton *needCustomBtn;

@property(nonatomic, strong) UIButton *hotDisplayBtn;
@property(nonatomic, strong) UIButton *newsDisplayBtn;
@property(nonatomic, strong) UIButton *recDisplayBtn;

@end

@implementation HomeTopLayout

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLayout];
    }
    return self;
}
-(void)setChildImageModel:(NSArray *)childImageModel
{
    _childImageModel = childImageModel;
    if (_childImageModel != nil && _childImageModel.count > 0) {
        self.imagePlayView.localizationImageNamesGroup = _childImageModel;
        if (_childImageModel.count > 1) {
            [self onStartPlayImage];
        }else{
            [self onStopPlayImage];
        }
    }
    
}
#pragma mark --私有方法
/**
 *  开启轮播广告
 */
-(void)onStartPlayImage
{
    if (self.imagePlayView && self.childImageModel.count > 1) {
        self.imagePlayView.autoScroll = YES;
        kNSLog(@"开始轮播");
    }
}

/**
 *  暂停轮播广告
 */
-(void)onStopPlayImage
{
    if (self.imagePlayView) {
        self.imagePlayView.autoScroll = NO;
        kNSLog(@"停止轮播");
    }
}

#pragma mark --SDCycleScrollViewDelegate
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    if (self.cycleScrollClickBlock) {
        self.cycleScrollClickBlock(cycleScrollView,index);
    }
}

#pragma mark -  action
- (void)convActivityBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}
- (void)moreDisplayBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}
- (void)needCustomBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}

- (void)hotDisplayBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}
- (void)newsDisplayBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}
- (void)recDisplayBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}



#pragma mark - 创建布局
- (void)createLayout {
    //轮播图
    _imagePlayView = [[SDCycleScrollView alloc] init];
    _imagePlayView.autoScrollTimeInterval = 4.0f;
    _imagePlayView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _imagePlayView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    _imagePlayView.pageDotImage = [UIImage imageNamed:kHomeDcycleOther];
    _imagePlayView.currentPageDotImage = [UIImage imageNamed:kHomeDcycleCurrent];
    _imagePlayView.placeholderImage = [UIImage imageNamed:kHomeDcyclePlaceholder];
    _imagePlayView.bannerImageViewContentMode = UIViewContentModeRedraw;
    [_imagePlayView setNeedsDisplay];
    _imagePlayView.delegate = self;
    [self addSubview:_imagePlayView];
    _imagePlayView.myLeftMargin = _imagePlayView.myRightMargin = _imagePlayView.myTopMargin = 0;
    _imagePlayView.myHeight = 130;
    
    //中部功能按钮
    MyRelativeLayout *centerLayout = [[MyRelativeLayout alloc] init];
    [self addSubview:centerLayout];
    centerLayout.topPos.equalTo(_imagePlayView.bottomPos).offset(5);
    centerLayout.widthDime.equalTo(self.widthDime);
    centerLayout.heightDime.equalTo(self.widthDime).multiply(0.33).multiply(0.4);
    centerLayout.backgroundColor = [UIColor orangeColor];
    
    _convActivityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _convActivityBtn.backgroundColor = [UIColor brownColor];
    kViewRadius(_convActivityBtn, 5.0);
    [_convActivityBtn addTarget:self action:@selector(convActivityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerLayout addSubview:_convActivityBtn];
    _moreDisplayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _moreDisplayBtn.backgroundColor = [UIColor brownColor];
    kViewRadius(_moreDisplayBtn, 5.0);
    [_moreDisplayBtn addTarget:self action:@selector(moreDisplayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerLayout addSubview:_moreDisplayBtn];
    _needCustomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _needCustomBtn.backgroundColor = [UIColor brownColor];
    kViewRadius(_needCustomBtn, 5.0);
    [_needCustomBtn addTarget:self action:@selector(needCustomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerLayout addSubview:_needCustomBtn];
    
    _convActivityBtn.myTopMargin = _convActivityBtn.myBottomMargin = 5;
    _convActivityBtn.widthDime.equalTo(centerLayout.widthDime).multiply(0.315);
    _convActivityBtn.centerXPos.equalTo(centerLayout.centerXPos);
    
    _moreDisplayBtn.widthDime.equalTo(_convActivityBtn.widthDime);
    _moreDisplayBtn.leftPos.equalTo(centerLayout.leftPos).offset(5);
    _moreDisplayBtn.myTopMargin = _moreDisplayBtn.myBottomMargin = 5;
    
    _needCustomBtn.widthDime.equalTo(_convActivityBtn.widthDime);
    _needCustomBtn.rightPos.equalTo(centerLayout.rightPos).offset(5);
    _needCustomBtn.myTopMargin = _needCustomBtn.myBottomMargin = 5;
    
    //底部功能按钮
    MyRelativeLayout *bottomLayout = [[MyRelativeLayout alloc] init];
    [self addSubview:bottomLayout];
    bottomLayout.topPos.equalTo(centerLayout.bottomPos).offset(5);
    bottomLayout.widthDime.equalTo(self.widthDime);
    bottomLayout.myHeight = 60;
    bottomLayout.backgroundColor = [UIColor orangeColor];
    
    _hotDisplayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _hotDisplayBtn.backgroundColor = [UIColor brownColor];
    kViewRadius(_hotDisplayBtn, 5.0);
    [_hotDisplayBtn addTarget:self action:@selector(hotDisplayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomLayout addSubview:_hotDisplayBtn];
    _newsDisplayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _newsDisplayBtn.backgroundColor = [UIColor brownColor];
    kViewRadius(_newsDisplayBtn, 5.0);
    [_newsDisplayBtn addTarget:self action:@selector(newsDisplayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomLayout addSubview:_newsDisplayBtn];
    _recDisplayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _recDisplayBtn.backgroundColor = [UIColor brownColor];
    kViewRadius(_recDisplayBtn, 5.0);
    [_recDisplayBtn addTarget:self action:@selector(recDisplayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomLayout addSubview:_recDisplayBtn];
    
    _hotDisplayBtn.myTopMargin = _hotDisplayBtn.myBottomMargin = 5;
    _hotDisplayBtn.widthDime.equalTo(bottomLayout.widthDime).multiply(0.315);
    _hotDisplayBtn.centerXPos.equalTo(bottomLayout.centerXPos);
    
    _newsDisplayBtn.widthDime.equalTo(_hotDisplayBtn.widthDime);
    _newsDisplayBtn.leftPos.equalTo(bottomLayout.leftPos).offset(5);
    _newsDisplayBtn.myTopMargin = _newsDisplayBtn.myBottomMargin = 5;
    
    _recDisplayBtn.widthDime.equalTo(_hotDisplayBtn.widthDime);
    _recDisplayBtn.rightPos.equalTo(bottomLayout.rightPos).offset(5);
    _recDisplayBtn.myTopMargin = _recDisplayBtn.myBottomMargin = 5;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
