//
//  HomeViewController.m
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "HomeViewController.h"
#import "LocationViewController.h"

#import "SearchViewLayout.h"
#import "HomeViewLayout.h"

@interface HomeViewController ()

@property(nonatomic, strong) HomeViewLayout     *homeView;
@property(nonatomic, strong) SearchViewLayout   *searchView;

@property (nonatomic,strong) NSMutableArray     *imageArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupChildView];
    [self setupTouch];
    NSMutableArray *imageArr = [NSMutableArray array];
    for (int i = 1; i < 23; i ++ ) {
        [imageArr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"loading_7_%d",i]]];
    }
    self.imageArray = imageArr;
    [TCBProgressHUD showHUDWithImageArr:self.imageArray andShowView:self.view.window];
    WS(weakSelf);
    [AFHttpTool loadWithURLArray:@[HomeSpliceUrl,HomeListUrl] parameterArray:@[@{@"limit":@"4"},@{@"area_id":@"441900",@"limit":@"4"}] resultClassArray:@[[HomeResponse class],[HomeResponse class]] success:^(NSArray *resultArray) {
        HomeResponse *homeSlide = [resultArray firstObject];
        HomeResponse *homeList = [resultArray lastObject];
        if (homeSlide.status&&homeList.status) {
            
        }
        [TCBProgressHUD dissmissShowView:weakSelf.view.window];
    } failure:^(NSArray *errorArray) {
        
    }];

}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    kNavBarHidden(YES);
}

- (void)setupChildView {
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.homeView];
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
}
#pragma mark -- 懒加载
-(HomeViewLayout *)homeView
{
    if (!_homeView) {
        _homeView = [[HomeViewLayout alloc] init];
        _homeView.myLeftMargin = 0;
        _homeView.myRightMargin = 0;
        _homeView.myTopMargin = 70;
        _homeView.myBottomMargin = 12;
    }
    return _homeView;
}
-(SearchViewLayout *)searchView
{
    if (!_searchView) {
        _searchView = [[SearchViewLayout alloc] init];
        _searchView.myLeftMargin = 0;
        _searchView.myRightMargin = 0;
        _searchView.myTopMargin = 20;
        //同时指定左右边距为0表示宽度和父视图一样宽
        _searchView.heightDime.equalTo(@(50));
    }
    return _searchView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
