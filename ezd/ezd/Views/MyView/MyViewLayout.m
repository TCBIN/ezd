//
//  MyViewLayout.m
//  VictorOC
//
//  Created by WebUser on 17/4/6.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "MyViewLayout.h"

@interface MyViewLayout ()<UITableViewDataSource>


@end

@implementation MyViewLayout

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.baseArray addObjectsFromArray:@[@"0",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2",@"1"]];
        [self addSubview:self.baseTableView];
        self.baseTableView.myLeftMargin = self.baseTableView.myRightMargin = 0;
        self.baseTableView.topPos.equalTo(self.topPos);
        self.baseTableView.heightDime.equalTo(self.heightDime);
    }
    return self;
}
#pragma mark --UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.baseArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"MyCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.baseArray[indexPath.item];
    return cell;
}



#pragma mark -  懒加载

- (UITableView *)baseTableView {
    if (!_baseTableView) {
        _baseTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _baseTableView.dataSource = self;
        _baseTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, _baseTableView.bounds.size.width, 0.01f)];
    }
    return _baseTableView;
}

- (NSMutableArray *)baseArray {
    if (!_baseArray) {
        _baseArray = [NSMutableArray array];
    }
    return _baseArray;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
