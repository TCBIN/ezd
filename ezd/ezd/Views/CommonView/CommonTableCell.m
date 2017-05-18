//
//  HomeTableCell.m
//  ezd
//
//  Created by WebUser on 17/4/7.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import "CommonTableCell.h"

@interface CommonTableCell ()

/**图片*/
@property(nonatomic, strong) UIImageView *homeCellImage;
/**标题*/
@property(nonatomic, strong) CustomLabel *titleCellLabel;
/**单位*/
@property(nonatomic, strong) CustomLabel *unitCellLabel;
/**成交量*/
@property(nonatomic, strong) CustomLabel *successCellLabel;
/**地址*/
@property(nonatomic, strong) CustomLabel *addressCellLabel;
/**便民日*/
@property(nonatomic, strong) CustomLabel *flagRiCellLabel;
/**室内外*/
@property(nonatomic, strong) CustomLabel *flagShiCelllabel;

@end

@implementation CommonTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createLayout];
        
        
    }
    return self;
}

#pragma mark - 创建布局
- (void)createLayout {
    MyRelativeLayout *rootLayout = [[MyRelativeLayout alloc] init];
    rootLayout.widthDime.equalTo(self.contentView.widthDime);
    rootLayout.wrapContentHeight = YES;
    _rootLayout = rootLayout;
    [self.contentView addSubview:rootLayout];
    
    //图片
    MyRelativeLayout *imageLayout = [[MyRelativeLayout alloc] init];
    [rootLayout addSubview:imageLayout];
    _homeCellImage = [[UIImageView alloc] init];
    _homeCellImage.image = [UIImage imageNamed:kHomeCellListImage];
    [imageLayout addSubview:_homeCellImage];
    imageLayout.myHeight = imageLayout.myWidth = 100;
    imageLayout.leftPos.equalTo(rootLayout.leftPos);
    _homeCellImage.myMargin = 5;
    
    //详情
    MyRelativeLayout *rightLayout = [[MyRelativeLayout alloc] init];
    rightLayout.heightDime.equalTo(imageLayout.heightDime);
    rightLayout.rightPos.equalTo(rootLayout.rightPos);
    rightLayout.leftPos.equalTo(imageLayout.rightPos);
    [rootLayout addSubview:rightLayout];
    
    MyRelativeLayout *rightTopLayout = [[MyRelativeLayout alloc] init];
    [rightLayout addSubview:rightTopLayout];
    MyRelativeLayout *rightCenterLayout = [[MyRelativeLayout alloc] init];
    [rightLayout addSubview:rightCenterLayout];
    MyRelativeLayout *rightBottomLayout = [[MyRelativeLayout alloc] init];
    [rightLayout addSubview:rightBottomLayout];
    
    
    //详情顶部
    rightTopLayout.leftPos.equalTo(rightLayout.leftPos);
    rightTopLayout.bottomPos.equalTo(rightCenterLayout.topPos);
    rightTopLayout.heightDime.equalTo(rightLayout.heightDime).multiply(0.33);
    rightTopLayout.rightPos.equalTo(rightLayout.rightPos).offset(5);
    
    _titleCellLabel = [[CustomLabel alloc] init];
    _titleCellLabel.textInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    _titleCellLabel.font = [UIFont systemFontOfSize:kTSize11];
    _titleCellLabel.textColor = [UIColor blackColor];
    _titleCellLabel.text = kHomeCellTitleText;
    _titleCellLabel.numberOfLines = 0;
    [rightTopLayout addSubview:_titleCellLabel];
    _unitCellLabel = [[CustomLabel alloc] init];
    _unitCellLabel.textAlignment = NSTextAlignmentCenter;
    _unitCellLabel.font = [UIFont systemFontOfSize:kTSize11];
    _unitCellLabel.textColor = [UIColor grayColor];
    _unitCellLabel.text = kHomeCellUnitText;
    _unitCellLabel.numberOfLines = 0;
    [rightTopLayout addSubview:_unitCellLabel];
    _titleCellLabel.heightDime.equalTo(rightTopLayout.heightDime);
    _titleCellLabel.widthDime.equalTo(rightTopLayout.widthDime).multiply(0.75);
    
    _unitCellLabel.heightDime.equalTo(rightTopLayout.heightDime);
    _unitCellLabel.rightPos.equalTo(rightTopLayout.rightPos);
    _unitCellLabel.widthDime.equalTo(rightTopLayout.widthDime).multiply(0.25);
    
    //详情中部
    rightCenterLayout.leftPos.equalTo(rightLayout.leftPos);
    rightCenterLayout.centerYPos.equalTo(rightLayout.centerYPos);
    rightCenterLayout.heightDime.equalTo(rightLayout.heightDime).multiply(0.33);
    rightCenterLayout.rightPos.equalTo(rightLayout.rightPos).offset(5);
    
    _flagRiCellLabel = [[CustomLabel alloc] init];
    _flagRiCellLabel.textAlignment = NSTextAlignmentCenter;
    _flagRiCellLabel.font = [UIFont systemFontOfSize:kTSize11];
    _flagRiCellLabel.textColor = [UIColor orangeColor];
    _flagRiCellLabel.text = kHomeCellFlagText;
    kViewBorder(_flagRiCellLabel, [UIColor orangeColor], 0.5);
    [rightCenterLayout addSubview:_flagRiCellLabel];
    _flagRiCellLabel.heightDime.equalTo(rightCenterLayout.heightDime).multiply(0.7);
    _flagRiCellLabel.widthDime.equalTo(rightCenterLayout.widthDime).multiply(0.25);
    _flagRiCellLabel.centerYPos.equalTo(rightCenterLayout.centerYPos);
    _flagRiCellLabel.leftPos.equalTo(rightCenterLayout.leftPos).offset(5);
    
    _flagShiCelllabel = [[CustomLabel alloc] init];
    _flagShiCelllabel.textAlignment = NSTextAlignmentCenter;
    _flagShiCelllabel.font = [UIFont systemFontOfSize:kTSize11];
    _flagShiCelllabel.textColor = [UIColor greenColor];
    _flagShiCelllabel.text = kHomeCellFlagText;
    kViewBorder(_flagShiCelllabel, [UIColor greenColor], 0.5);
    [rightCenterLayout addSubview:_flagShiCelllabel];
    _flagShiCelllabel.heightDime.equalTo(rightCenterLayout.heightDime).multiply(0.7);
    _flagShiCelllabel.leftPos.equalTo(_flagRiCellLabel.rightPos).offset(5);
    _flagShiCelllabel.widthDime.equalTo(rightCenterLayout.widthDime).multiply(0.25);
    _flagShiCelllabel.centerYPos.equalTo(rightCenterLayout.centerYPos);
    
    _successCellLabel = [[CustomLabel alloc] init];
    _successCellLabel.textAlignment = NSTextAlignmentCenter;
    _successCellLabel.font = [UIFont systemFontOfSize:kTSize11];
    _successCellLabel.textColor = [UIColor grayColor];
    _successCellLabel.text = kHomeCellSuccessText;
    [rightCenterLayout addSubview:_successCellLabel];
    _successCellLabel.heightDime.equalTo(rightCenterLayout.heightDime).multiply(0.8);
    _successCellLabel.rightPos.equalTo(rightCenterLayout.rightPos);
    _successCellLabel.widthDime.equalTo(rightCenterLayout.widthDime).multiply(0.25);
    _successCellLabel.centerYPos.equalTo(rightCenterLayout.centerYPos);
    
    //详情底部
    rightBottomLayout.leftPos.equalTo(rightLayout.leftPos);
    rightBottomLayout.topPos.equalTo(rightCenterLayout.bottomPos);
    rightBottomLayout.heightDime.equalTo(rightLayout.heightDime).multiply(0.33);
    rightBottomLayout.rightPos.equalTo(rightLayout.rightPos).offset(5);
    
    _addressCellLabel = [[CustomLabel alloc] init];
    _addressCellLabel.textInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    _addressCellLabel.font = [UIFont systemFontOfSize:kTSize10];
    _addressCellLabel.textColor = [UIColor blackColor];
    _addressCellLabel.text = kHomeCellAddressText;
    _addressCellLabel.numberOfLines = 0;
    [rightBottomLayout addSubview:_addressCellLabel];
    _addressCellLabel.myMargin = 3;
}

@end
