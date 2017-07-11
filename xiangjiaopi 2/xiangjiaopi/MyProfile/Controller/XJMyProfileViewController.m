//
//  XJMyProfileViewController.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/1.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJMyProfileViewController.h"
#import "MyHeadView.h"
#import "XJMyTableViewCell.h"

#define myTableViewCellDentifier @"XJMyTableViewCell"
@interface XJMyProfileViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView * myTableView;
@property (nonatomic, strong)MyHeadView * myView;

@end

@implementation XJMyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"----test");
    self.title = @"我的";
    [self creatTableView];
}

- (void)creatTableView {
    
    self.myTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView registerClass:[XJMyTableViewCell class] forCellReuseIdentifier:myTableViewCellDentifier];
    [self.view addSubview:self.myTableView];
    
    self.myView = [[MyHeadView alloc]initWithFrame:(CGRect){0,0,self.view.frame.size.width,420}];
    self.myTableView.tableHeaderView = self.myView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray * array = [NSArray arrayWithObjects:@"交易记录",@"帮助",@"设置", nil];
    
    XJMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myTableViewCellDentifier];
    [cell settitleLabelText:array[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
