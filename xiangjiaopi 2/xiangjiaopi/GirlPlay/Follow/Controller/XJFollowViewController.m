//
//  XJFollowViewController.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/1.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJFollowViewController.h"

@interface XJFollowViewController ()

@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation XJFollowViewController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    self.imageView.backgroundColor = [UIColor redColor];
    [self setupFrames];
}

#pragma mark - setup
- (void)setupViews{

    [self.view addSubview:self.imageView];
}

- (void)setupFrames{

    self.imageView.frame = self.view.bounds;
}

#pragma mark - setter and getter
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _imageView;
}


@end
