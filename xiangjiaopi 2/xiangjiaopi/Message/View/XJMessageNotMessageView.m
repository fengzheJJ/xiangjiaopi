//
//  XJMessageNotMessageView.m
//  xiangjiaopi
//
//  Created by 冯喆 on 2017/7/8.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJMessageNotMessageView.h"

@interface XJMessageNotMessageView ()

@property (nonatomic, strong) UILabel *titleViewLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation XJMessageNotMessageView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.titleViewLabel = [[UILabel alloc]initWithFrame:(CGRect){0,105,self.frame.size.width,150}];
        self.titleViewLabel.textAlignment = NSTextAlignmentCenter;
        self.titleViewLabel.font = [UIFont fontWithName:@"iconfont" size:95];
        self.titleViewLabel.text = @"\U0000e64f";
        self.titleViewLabel.textColor = [UIColor colorFromHexString:@"#d7d7d7"];
        [self addSubview:self.titleViewLabel];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:(CGRect){0,235,self.frame.size.width,30}];
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        self.titleLabel.text = @"暂无消息";
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor colorFromConfigColor:XJTextSecondTextColor];
        [self addSubview:self.titleLabel];
        
        self.detailLabel = [[UILabel alloc]initWithFrame:(CGRect){0,270,self.frame.size.width,20}];
        self.detailLabel.font = [UIFont systemFontOfSize:14];
        self.detailLabel.text = @"去找你心仪的主播聊聊吧";
        self.detailLabel.textAlignment = NSTextAlignmentCenter;
        self.detailLabel.textColor = [UIColor colorFromConfigColor:XJTextSecondTextColor];
        [self addSubview:self.detailLabel];
    }
    return self;
}

@end
