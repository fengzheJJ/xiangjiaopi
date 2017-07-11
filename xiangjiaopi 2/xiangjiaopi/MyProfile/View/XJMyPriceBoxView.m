//
//  XJMyPriceBoxView.m
//  xiangjiaopi
//
//  Created by 冯喆 on 2017/7/10.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJMyPriceBoxView.h"

@interface XJMyPriceBoxView ()

@property (nonatomic, strong) UILabel *titleLabel; //今日收入
@property (nonatomic, strong) UILabel *numberLabel; //金币总计
@property (nonatomic, strong) UILabel *detailLabel; //累计收入

//@property (nonatomic, strong) UILabel *priceTitleLabel; //当前语音价位
//@property (nonatomic, strong) UILabel *priceNumberLabel; //金币单价
//@property (nonatomic, strong) UILabel *pricedetailLabel; //价位详情

@end

@implementation XJMyPriceBoxView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel = [[UILabel alloc]initWithFrame:(CGRect){0,12,self.frame.size.width,25}];
        self.titleLabel.text = @"今日收入";
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel];
        
        self.numberLabel = [[UILabel alloc]initWithFrame:(CGRect){0,self.titleLabel.frame.size.height + self.titleLabel.frame.origin.y,self.frame.size.width,35}];
        self.numberLabel.textAlignment = NSTextAlignmentCenter;
        self.numberLabel.font = [UIFont boldSystemFontOfSize:26];
        self.numberLabel.text = @"27837金币";
        [self addSubview:self.numberLabel];
        
        self.detailLabel = [[UILabel alloc]initWithFrame:(CGRect){0,self.numberLabel.frame.size.height + self.numberLabel.frame.origin.y + 10,self.frame.size.width,14}];
        self.detailLabel.font = [UIFont systemFontOfSize:15];
        self.detailLabel.textAlignment = NSTextAlignmentCenter;
        self.detailLabel.text = @"累计收入292223金币";
        [self addSubview:self.detailLabel];
        
    }
    return self;
}

@end
