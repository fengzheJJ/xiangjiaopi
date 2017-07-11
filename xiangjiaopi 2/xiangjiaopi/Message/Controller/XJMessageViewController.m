//
//  XJMessageViewController.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/1.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJMessageViewController.h"
#import "XJMessageRootHeadView.h"
#import "XJMessageNotMessageView.h"

@interface XJMessageViewController ()

@end

@implementation XJMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    XJMessageRootHeadView *headView = [[XJMessageRootHeadView alloc]initWithFrame:(CGRect){0,0,self.view.frame.size.width, 55}];
    [self.view addSubview:headView];
    
    XJMessageNotMessageView *notMessageView = [[XJMessageNotMessageView alloc]initWithFrame:(CGRect){0,55,self.view.frame.size.width, self.view.frame.size.height - 55}];
    [self.view addSubview:notMessageView];
    
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
