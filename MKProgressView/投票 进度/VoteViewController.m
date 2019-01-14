//
//  VoteViewController.m
//  MKProgressView
//
//  Created by shuxia on 2019/1/12.
//  Copyright © 2019 shuxia. All rights reserved.
//

#import "VoteViewController.h"

#import "VoteTableViewCell.h"




@interface VoteViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *dataSource;

@property (nonatomic,strong)UITableView *dataTableView;
@end

@implementation VoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataTableView.frame = self.view.bounds;
    [self.view addSubview:self.dataTableView];
    VoteModel *vote = [VoteModel new];
    [self.dataSource addObject:vote];
    
    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        vote.proressM += 0.1;
    }];
}
-(NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}
-(UITableView *)dataTableView
{
    if (!_dataTableView) {
        
        _dataTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        _dataTableView.dataSource=self;
        _dataTableView.delegate=self;
        _dataTableView.tableFooterView=[UIView new];

        
        [_dataTableView registerClass:[VoteTableViewCell class] forCellReuseIdentifier:@"Vote"];

    }
    return _dataTableView;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    VoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Vote" forIndexPath:indexPath];

    
    cell.vModel = self.dataSource[indexPath.row];
    
    
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.00001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001;
    
}

@end
