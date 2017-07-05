//
//  XJGirlPlayContentViewController.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/4.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJGirlPlayContentViewController.h"
#import "XJGirlPlayHomeContentItemModel.h"
#import "XJGirlPlayHomeContentTableViewCell.h"

@interface XJGirlPlayContentViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)UITableView *mainTableView;
@end

@implementation XJGirlPlayContentViewController
#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self setupFrames];
    [self loadData];
    // Do any additional setup after loading the view.
}

#pragma mark - setup
- (void)setupViews{
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainTableView];
}

- (void)setupFrames{
    
    CGFloat width = self.view.width;
    CGFloat height = self.view.height;
    self.mainTableView.frame = CGRectMake(0, 0, width, height);
}

- (void)loadData{

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"act_time"] = @"0";
    dict[@"limit"] = @"20";
    dict[@"lon"] = @"123.343433";
    dict[@"lat"] = @"45.2343243";
    [[XJNetApiManager sharedManager] request_homepagehot_params:dict block:^(id data, NSError *error) {
        if (!error) {
            self.dataArr = [XJGirlPlayHomeContentItemModel mj_objectArrayWithKeyValuesArray:data[@"data"]];
        }
        [self.mainTableView reloadData];
    }];
    
    [[XJNetApiManager sharedManager] request_homeAds_params:nil block:^(id data, NSError *error) {
        
    }];
}
#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.dataArr.count) {
        return self.dataArr.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    XJGirlPlayHomeContentTableViewCell * cell = [XJGirlPlayHomeContentTableViewCell cellWithTableView:tableView];
    if (self.dataArr.count) {
        cell.itemModel = self.dataArr[indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return XJGirlPlayHomeContentTableViewCellH;
}
#pragma mark - setter and getter
- (UITableView *)mainTableView{

    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}

@end
