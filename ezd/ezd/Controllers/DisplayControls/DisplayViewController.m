//
//  DisplayViewController.m
//  ezd
//
//  Created by WebUser on 17/4/6.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import "DisplayViewController.h"
#import "LocationViewController.h"

#import "SearchViewLayout.h"
#import "ConditionViewLayout.h"
#import "DisplayViewLayout.h"
#import "FilterViewLayout.h"

@interface DisplayViewController ()

@property(nonatomic, strong) SearchViewLayout     *searchView;
@property(nonatomic, strong) ConditionViewLayout  *conditionView;
@property(nonatomic, strong) DisplayViewLayout    *displayView;
@property(nonatomic, strong) FilterViewLayout     *filterView;

@end

@implementation DisplayViewController

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
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.conditionView];
    [self.view addSubview:self.displayView];
    
}
- (void)setupTouch {
    WS(weakSelf);
    self.searchView.locationBlock = ^(NSString *cid, NSString *cname) {
        LocationViewController *locationVC = [[LocationViewController alloc] init];
        [weakSelf presentViewController:locationVC animated:NO completion:nil];
    };
    self.searchView.searchBlock = ^(NSString *text) {
        kNSLog(@"搜索");
    };
    
    self.conditionView.filterBlock = ^(BOOL isSelected) {
        [weakSelf.filterView showFilterView:weakSelf.filterView isShow:YES];
    };
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 懒加载
- (DisplayViewLayout *)displayView {
    if (!_displayView) {
        _displayView = [[DisplayViewLayout alloc] init];
        _displayView.myLeftMargin = _displayView.myRightMargin = 0;
        _displayView.myTopMargin = 110;
        _displayView.myBottomMargin = 12;
    }
    return _displayView;
}
- (SearchViewLayout *)searchView {
    if (!_searchView) {
        _searchView = [[SearchViewLayout alloc] init];
        _searchView.myLeftMargin = _searchView.myRightMargin = 0;
        _searchView.myTopMargin = 20;
        //同时指定左右边距为0表示宽度和父视图一样宽
        _searchView.heightDime.equalTo(@(50));
    }
    return _searchView;
}
- (ConditionViewLayout *)conditionView {
    if (!_conditionView) {
//        _conditionView = [[ConditionViewLayout alloc] initWithFrame:CGRectMake(0, 70, kScreenWidth, 40)];
        _conditionView = [[ConditionViewLayout alloc] init];
        _conditionView.myLeftMargin = _conditionView.myRightMargin = 0;
        _conditionView.myTopMargin = 70;
        //同时指定左右边距为0表示宽度和父视图一样宽
        _conditionView.heightDime.equalTo(@(40));
    }
    return _conditionView;
}
- (FilterViewLayout *)filterView {
    if (!_filterView) {
        _filterView = [[FilterViewLayout alloc] initWithFrame:CGRectMake(kScreenWidth, 20, kScreenWidth, kScreenHeight-20)];
    }
    return _filterView;
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
