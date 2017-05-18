//
//  MyViewController.m
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "MyViewController.h"

#import "MyViewLayout.h"

@interface MyViewController ()

@property(nonatomic, strong) MyViewLayout *myView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.myView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    kNavBarHidden(YES);
}
#pragma mark -- 懒加载
-(MyViewLayout *)myView
{
    if (!_myView) {
        _myView = [MyViewLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
        _myView.myLeftMargin = 0;
        _myView.myRightMargin = 0;                          //同时指定左右边距为0表示宽度和父视图一样宽
//        _myView.myTopMargin = 0;
//        _myView.myBottomMargin = 0;
        _myView.heightDime.lBound(self.view.heightDime, 10, 0.5); //高度虽然是wrapContentHeight的。但是最小的高度不能低于父视图的高度加10.
    }
    return _myView;
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
