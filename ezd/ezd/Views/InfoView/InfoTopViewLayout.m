//
//  InfoTopViewLayout.m
//  ezd
//
//  Created by WebUser on 17/4/10.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import "InfoTopViewLayout.h"

@interface InfoTopViewLayout ()

@property(nonatomic, strong) UIButton *zdzxBtn;
@property(nonatomic, strong) UIButton *gfxwBtn;
@property(nonatomic, strong) UIButton *jdalBtn;
@property(nonatomic, strong) UIButton *sjxcBtn;
@property(nonatomic, strong) UIButton *dtktBtn;

@end

@implementation InfoTopViewLayout

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        self.userInteractionEnabled = YES;
        MyBorderLineDraw *lineTopDraw = [[MyBorderLineDraw alloc] initWithColor:[UIColor lightGrayColor]];
        lineTopDraw.dash = 0;
        self.topBorderLine = lineTopDraw;
        [self addSubview:self.zdzxBtn];
        [self addSubview:self.gfxwBtn];
        [self addSubview:self.jdalBtn];
        [self addSubview:self.sjxcBtn];
        [self addSubview:self.dtktBtn];
        
        self.zdzxBtn.leftPos.equalTo(self.leftPos);
        self.zdzxBtn.centerYPos.equalTo(self.centerYPos);
        self.zdzxBtn.widthDime.equalTo(self.widthDime).multiply(0.215);
        self.zdzxBtn.heightDime.equalTo(self.heightDime);
        
        self.gfxwBtn.leftPos.equalTo(self.zdzxBtn.rightPos);
        self.gfxwBtn.centerYPos.equalTo(self.centerYPos);
        self.gfxwBtn.widthDime.equalTo(self.widthDime).multiply(0.205);
        self.gfxwBtn.heightDime.equalTo(self.heightDime);
        
        self.jdalBtn.leftPos.equalTo(self.gfxwBtn.rightPos);
        self.jdalBtn.centerYPos.equalTo(self.centerYPos);
        self.jdalBtn.widthDime.equalTo(self.gfxwBtn.widthDime);
        self.jdalBtn.heightDime.equalTo(self.heightDime);
        
        self.sjxcBtn.leftPos.equalTo(self.jdalBtn.rightPos);
        self.sjxcBtn.centerYPos.equalTo(self.centerYPos);
        self.sjxcBtn.widthDime.equalTo(self.jdalBtn.widthDime);
        self.sjxcBtn.heightDime.equalTo(self.heightDime);
        
        self.dtktBtn.leftPos.equalTo(self.sjxcBtn.rightPos);
        self.dtktBtn.centerYPos.equalTo(self.centerYPos);
        self.dtktBtn.widthDime.equalTo(self.widthDime).multiply(0.17);
        self.dtktBtn.heightDime.equalTo(self.heightDime);
        
    }
    return self;
}


#pragma mark - action
- (void)zdzxBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}
- (void)gfxwBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}
- (void)jdalBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}
- (void)sjxcBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}
- (void)dtktBtnClick:(UIButton *)sender {
    kNSLog(@"点击");
}

#pragma mark  - 创建布局
- (void)createLayout {
    
}

- (UIButton *)zdzxBtn {
    if (!_zdzxBtn) {
        _zdzxBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zdzxBtn setTitle:kDisplayZDZXText forState:UIControlStateNormal];
        _zdzxBtn.titleLabel.font = [UIFont systemFontOfSize:kTSize12];
        [_zdzxBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_zdzxBtn addTarget:self action:@selector(zdzxBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zdzxBtn;
}
- (UIButton *)gfxwBtn {
    if (!_gfxwBtn) {
        _gfxwBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_gfxwBtn setTitle:kDisplayGFXWText forState:UIControlStateNormal];
        _gfxwBtn.titleLabel.font = [UIFont systemFontOfSize:kTSize12];
        [_gfxwBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_gfxwBtn addTarget:self action:@selector(gfxwBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _gfxwBtn;
}
- (UIButton *)jdalBtn {
    if (!_jdalBtn) {
        _jdalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_jdalBtn setTitle:kDisplayJDALText forState:UIControlStateNormal];
        _jdalBtn.titleLabel.font = [UIFont systemFontOfSize:kTSize12];
        [_jdalBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_jdalBtn addTarget:self action:@selector(jdalBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jdalBtn;
}
- (UIButton *)sjxcBtn {
    if (!_sjxcBtn) {
        _sjxcBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sjxcBtn setTitle:kDisplaySJXCText forState:UIControlStateNormal];
        _sjxcBtn.titleLabel.font = [UIFont systemFontOfSize:kTSize12];
        [_sjxcBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sjxcBtn addTarget:self action:@selector(sjxcBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sjxcBtn;
}
- (UIButton *)dtktBtn {
    if (!_dtktBtn) {
        _dtktBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dtktBtn setTitle:kDisplayDTKTText forState:UIControlStateNormal];
        _dtktBtn.titleLabel.font = [UIFont systemFontOfSize:kTSize12];
        [_dtktBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_dtktBtn addTarget:self action:@selector(dtktBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dtktBtn;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
