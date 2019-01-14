//
//  MainTableViewController.m
//  MKProgressView
//
//  Created by shuxia on 2019/1/12.
//  Copyright © 2019 shuxia. All rights reserved.
//

#import "MainTableViewController.h"
#import "VoteViewController.h"
#import "SectorProgressVC.h"
#import "CircleProgressVC.h"
@interface MainTableViewController ()
@property (nonatomic,strong)NSMutableArray *tableArr;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableArr  = [NSMutableArray arrayWithObjects:@"voteProgress",@"SectorView",@"CircleProgress",nil];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Progress"];
    

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.tableArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Progress" forIndexPath:indexPath];
    cell.textLabel.text = self.tableArr[indexPath.row];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *strForC = cell.textLabel.text;
    if ([strForC isEqualToString:@"voteProgress"]) {
        VoteViewController *vote = [VoteViewController new];
        [self.navigationController pushViewController:vote animated:YES];
    }
    if ([strForC isEqualToString:@"SectorView"]) {
        SectorProgressVC *vote = [SectorProgressVC new];
        [self.navigationController pushViewController:vote animated:YES];
    }
    if ([strForC isEqualToString:@"CircleProgress"]) {
        CircleProgressVC *vote = [CircleProgressVC new];
        [self.navigationController pushViewController:vote animated:YES];
    }

    
}
@end
