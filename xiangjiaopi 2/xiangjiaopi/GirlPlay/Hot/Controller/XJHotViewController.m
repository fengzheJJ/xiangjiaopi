//
//  XJHotViewController.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/1.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJHotViewController.h"

@interface XJHotViewController ()
@property (nonatomic,strong)UIImageView *imageView;

@property (nonatomic,strong)UIView * buyView;
@property (nonatomic,strong)UIImageView *buyImageView;
@end

@implementation XJHotViewController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    self.imageView.backgroundColor = [UIColor greenColor];
    [self setupFrames];
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"phone"] = @"15811186564";
    dict[@"push_token"] = @"sdfjddfs";
    dict[@"username"] = @"光之夏日";
    dict[@"sex"] = @"1";
    dict[@"avator"] = @"/2017/06/17/17/14976900576387.jpg";
    dict[@"code"] = @"123456";
    dict[@"birthday"] = @"1987-12-02";
    dict[@"location"] = @"1";
//    dict[@"sign"] = @"15811186564";
    [[XJNetApiManager sharedManager] request_register_params:dict block:^(id data, NSError *error) {
        
    }];
}

#pragma mark - setup
- (void)setupViews{
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.buyView];
    [self.buyView addSubview:self.buyImageView];
}

- (void)setupFrames{
    
    self.imageView.frame = CGRectMake(0, 0, self.view.width, self.view.height - 49 - 64);
    
}

#pragma mark - setter and getter
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [_imageView setImage:[UIImage imageNamed:@"图层 18.png"]];
    }
    return _imageView;
}

- (UIView *)buyView{

    if (!_buyView) {
        _buyView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _buyView;
}

- (UIImageView *)buyImageView{

    if (!_buyImageView) {
        _buyImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _buyImageView;
}
@end
