//
//  HomeViewLayout.m
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "HomeViewLayout.h"
#import "HomeTopLayout.h"
#import "CommonTableCell.h"


@interface HomeViewLayout()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation HomeViewLayout

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.homeArray addObjectsFromArray:@[@"0",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2",@"1"]];
        [self addSubview:self.homeTableView];
        self.homeTableView.leftPos.equalTo(self.leftPos);
        self.homeTableView.rightPos.equalTo(self.rightPos);
        self.homeTableView.topPos.equalTo(self.topPos);
        self.homeTableView.heightDime.equalTo(self.heightDime);
        
    }
    return self;
}
#pragma mark --UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.homeArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HomeTopLayout *topLayout = [[HomeTopLayout alloc] init];
    topLayout.myLeftMargin = topLayout.myRightMargin = topLayout.myTopMargin = 0;
    topLayout.childImageModel = @[kHomeDcyclePlaceholder,kHomeDcyclePlaceholder,kHomeDcyclePlaceholder];
    return topLayout;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 200+kScreenWidth*0.33*1.2;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // 注意这里。为了达到动态高度TableViewCell的加载性能最高以及高性能，一定要实现estimatedHeightForRowAtIndexPath这个方法。这个方法用来评估
    //UITableViewCell的高度。如果实现了这个方法，系统会根据数量重复调用这个方法，得出评估的总体高度。然后再根据显示的需要调用heightForRowAtIndexPath方法来确定真实的高度。如果您不实现estimatedHeightForRowAtIndexPath这个方法，加载性能将非常的低下！！！！
    return 100;  //这个评估尺寸你可以根据你的cell的一般高度来设置一个最合适的值。
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CommonTableCell *cell = (CommonTableCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    //通过布局视图的estimateLayoutRect函数能够评估出UITableViewCell的动态高度。estimateLayoutRect并不会进行布局
    //而只是评估布局的尺寸，这里的宽度不传0的原因是上面的UITableViewCell在建立时默认的宽度是320(不管任何尺寸都如此),因此如果我们
    //传递了宽度为0的话则会按320的宽度来评估UITableViewCell的动态高度，这样当在375和414的宽度时评估出来的高度将不会正确，因此这里需要
    //指定出真实的宽度尺寸；而高度设置为0的意思是表示高度不是固定值需要评估出来。
    //UITableViewCell的动态高度评估不局限于线性布局，相对布局也是同样适用的。
    CGRect rect = [cell.rootLayout estimateLayoutRect:CGSizeMake((tableView.frame.size.width), 0)];
    return rect.size.height;  //如果使用系统自带的分割线，请返回rect.size.height+1
    //    return 0.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"HomeCellId";
    CommonTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell = [[CommonTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}



#pragma mark -  懒加载

- (UITableView *)homeTableView {
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _homeTableView.dataSource = self;
        _homeTableView.delegate = self;
        _homeTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, _homeTableView.bounds.size.width, 0.01f)];
    }
    return _homeTableView;
}

- (NSMutableArray *)homeArray {
    if (!_homeArray) {
        _homeArray = [NSMutableArray array];
    }
    return _homeArray;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
