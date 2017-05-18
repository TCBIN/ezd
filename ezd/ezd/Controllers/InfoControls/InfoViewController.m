//
//  InfoViewController.m
//  ezd
//
//  Created by WebUser on 17/4/6.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import "InfoViewController.h"

#import "InfoViewLayout.h"
#import "InfoTopViewLayout.h"

@interface InfoViewController ()

@property(nonatomic, strong) InfoViewLayout     *infoView;
@property(nonatomic, strong) InfoTopViewLayout  *infoTopView;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupChildView];
    [self setupTouch];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    kNavBarHidden(YES);
}

- (void)setupChildView {
    [self.view addSubview:self.infoTopView];
    [self.view addSubview:self.infoView];
    
}
- (void)setupTouch {
//    WS(weakSelf);
    

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 懒加载
- (InfoViewLayout *)infoView {
    if (!_infoView) {
        _infoView = [[InfoViewLayout alloc] init];
        _infoView.myLeftMargin = _infoView.myRightMargin = 0;
        _infoView.myTopMargin = 70;
        _infoView.myBottomMargin = 12;
    }
    return _infoView;
}
- (InfoTopViewLayout *)infoTopView {
    if (!_infoTopView) {
        _infoTopView = [[InfoTopViewLayout alloc] init];
        _infoTopView.myLeftMargin = _infoTopView.myRightMargin = 0;
        _infoTopView.myTopMargin = 20;
        _infoTopView.heightDime.equalTo(@(50));
    }
    return _infoTopView;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
