//
//  SearchViewLayout.m
//  ezd
//
//  Created by WebUser on 17/4/6.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import "SearchViewLayout.h"
#import "CustomizeSearchView.h"


@interface SearchViewLayout ()

@property(nonatomic, strong) CustomLabel           *addressLabel;
@property(nonatomic, strong) CustomizeSearchView   *searchView;


@end

@implementation SearchViewLayout

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kHomeSearchBGColor;
        [self addSubview:self.addressLabel];
        [self addSubview:self.searchView];
        
        //设置布局属性
        self.addressLabel.myLeftMargin = 5;
        self.addressLabel.myHeight = 35;
        self.addressLabel.myWidth = 70;
        self.addressLabel.centerYPos.equalTo(@(0));
//        self.addressLabel.widthDime.equalTo(self.widthDime).multiply(.25).max(90); //宽度是父视图宽度的2/5,且最大只能是180。
        self.searchView.leftPos.equalTo(self.addressLabel.rightPos).offset(5);
        self.searchView.myRightMargin = 5;
        self.searchView.myHeight = 35;
        self.searchView.centerYPos.equalTo(self.addressLabel.centerYPos);
        [self setupTouch];
    }
    return self;
}

#pragma mark - 事件
- (void)setupTouch {
    WS(weakSelf);
    self.searchView.searchClickBlock = ^(NSString *searchContent) {
        if (weakSelf.searchBlock) {
            weakSelf.searchBlock(searchContent);
        }
    };
}
- (void)addresslabelClick {
    if (self.locationBlock) {
        self.locationBlock(@"cid",@"cname");
    }
}

#pragma mark - 懒加载

- (CustomLabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[CustomLabel alloc] init];
        //创建富文本
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:kHomeAddressText];
        //NSTextAttachment可以将要插入的图片作为特殊字符处理
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        //定义图片内容及位置和大小
        attch.image = [UIImage imageNamed:kHomeAddressImage];
        attch.bounds = CGRectMake(0, -5, 20, 20);
        //创建带有图片的富文本
        NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
        //将图片放在最后一位
        [attri appendAttributedString:string];
        //将图片放在第一位
//        [attri insertAttributedString:string atIndex:0];
        //用label的attributedText属性来使用富文本
        _addressLabel.attributedText = attri;
//        _addressLabel.text = kHomeAddressText;
        _addressLabel.font = [UIFont systemFontOfSize:kTSize15];
        _addressLabel.textColor = [UIColor blackColor];
        _addressLabel.textAlignment = NSTextAlignmentCenter;
        _addressLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addresslabelClick)];
        [_addressLabel addGestureRecognizer:tapGesture];
    }
    return _addressLabel;
}

- (CustomizeSearchView *)searchView {
    if (!_searchView) {
        _searchView = [CustomizeSearchView customizeSearchView];
        [_searchView setupIcon:nil placeholder:kHomeSearchText searchBg:kHomeSearchImage];
        [_searchView sizeToFit];
        kViewRadius(_searchView, 5.0);
        kViewBorder(_searchView, [UIColor redColor], 0.5);
        _searchView.backgroundColor = [UIColor blackColor];
    }
    return _searchView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
