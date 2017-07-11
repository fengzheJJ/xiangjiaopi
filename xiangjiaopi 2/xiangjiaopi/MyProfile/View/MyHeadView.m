//
//  MyHeadView.m
//  xiangjiaopi
//
//  Created by 冯喆 on 2017/7/8.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "MyHeadView.h"
#import "XJMyPriceBoxView.h"

@interface MyHeadView ()

@property (nonatomic, strong) UIView *userBgView;
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UILabel *iconLabel;

@property (nonatomic, strong) UIView *anchorBgView;
@property (nonatomic, strong) UILabel *anchorTitleLabel;
@property (nonatomic, strong) UIView *titleLineView;

//@property (nonatomic, strong) UILabel *incomeLabel; //今日收入
//@property (nonatomic, strong) UILabel *incomeNumberLabel; //金币总计
//@property (nonatomic, strong) UILabel *incomeTotalLabel; //累计收入
//
//@property (nonatomic, strong) UILabel *priceTitleLabel; //当前语音价位
//@property (nonatomic, strong) UILabel *priceNumberLabel; //金币单价
//@property (nonatomic, strong) UILabel *pricedetailLabel; //价位详情
@property (nonatomic, strong) XJMyPriceBoxView *myPriceLeftBoxView;
@property (nonatomic, strong) XJMyPriceBoxView *myPriceRightBoxView;
@property (nonatomic, strong) UIView *priceBoxBottomView;

@property (nonatomic, strong) UIButton *incomeManageButton; //收入管理
@property (nonatomic, strong) UIView *incomeMangeCenterView; //中间分割线
@property (nonatomic, strong) UIButton *priceSettingButton; //主播设置

@property (nonatomic, strong) UIView *chargeBgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UIButton *chargeButton;

@end

@implementation MyHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorFromConfigColor:XJMainBackgroundColor];
        
        self.userBgView = [[UIView alloc]initWithFrame:(CGRect){0,13,self.frame.size.width,76}];
        self.userBgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.userBgView];
        
        self.userImageView = [[UIImageView alloc]initWithFrame:(CGRect){25,10,55,55}];
//        self.userImageView.image = [UIImage imageNamed:@"my"];
        self.userImageView.layer.cornerRadius = 8;
        self.userImageView.backgroundColor = [UIColor blueColor];
        [self.userBgView addSubview:self.userImageView];
        
        
        self.nameLabel = [[UILabel alloc]initWithFrame:(CGRect){self.userImageView.frame.size.width + self.userImageView.frame.origin.x + 10 ,self.userImageView.frame.origin.y,self.frame.size.width - 76,self.userImageView.frame.size.height / 2}];
        self.nameLabel.text = @"安妮梦梦";
        self.nameLabel.textColor = [UIColor blackColor];
        self.nameLabel.font = [UIFont systemFontOfSize:22];
        [self.userBgView addSubview:self.nameLabel];
        
        self.detailLabel = [[UILabel alloc]initWithFrame:(CGRect){self.nameLabel.frame.origin.x, self.nameLabel.frame.size.height +  self.nameLabel.frame.origin.y,self.frame.size.width - 118,self.userImageView.frame.size.height / 2}];
        self.detailLabel.text = @"我有一个梦，梦中有王子";
        self.detailLabel.textColor = [UIColor colorFromHexString:@"#989898"];
        self.detailLabel.font = [UIFont systemFontOfSize:16];
        [self.userBgView addSubview:self.detailLabel];
        
        self.iconLabel = [[UILabel alloc]initWithFrame:(CGRect){self.userBgView.frame.size.width - 50 ,self.userBgView.frame.size.height / 2 - 10,20,20}];
        self.iconLabel.textColor = [UIColor colorFromHexString:@"#989898"];
        self.iconLabel.font = [UIFont fontWithName:@"iconfont" size:20];
        self.iconLabel.text = @"\U0000e649";
        [self.userBgView addSubview:self.iconLabel];
        
        [self creatAnchorView];
        [self chargeView];
        
    }
    return self;
}

- (void)creatAnchorView {
    self.anchorBgView = [[UIView alloc]initWithFrame:(CGRect){0,self.userBgView.frame.origin.y + self.userBgView.frame.size.height + 13 ,self.frame.size.width,231}];
    self.anchorBgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.anchorBgView];
    
    self.anchorTitleLabel = [[UILabel alloc]initWithFrame:(CGRect){25,0,self.frame.size.width - 25 ,60}];
    self.anchorTitleLabel.text = @"主播管理";
    self.anchorTitleLabel.textColor = [UIColor blackColor];
    self.anchorTitleLabel.font = [UIFont systemFontOfSize:20];
    [self.anchorBgView addSubview:self.anchorTitleLabel];
    
    self.titleLineView = [[UIView alloc]initWithFrame:(CGRect){0,60,self.frame.size.width,0.5}];
    self.titleLineView.backgroundColor = [UIColor colorFromConfigColor:XJAuxiliaryInsideSeparationColor];
    [self.anchorBgView addSubview:self.titleLineView];
    
    self.myPriceLeftBoxView = [[XJMyPriceBoxView alloc]initWithFrame:(CGRect){0,self.titleLineView.frame.size.height + self.titleLineView.frame.origin.y,self.frame.size.width / 2,110}];
    self.myPriceLeftBoxView.backgroundColor = [UIColor whiteColor];
    [self.anchorBgView addSubview:self.myPriceLeftBoxView];
    
    self.myPriceRightBoxView = [[XJMyPriceBoxView alloc]initWithFrame:(CGRect){self.frame.size.width / 2,self.titleLineView.frame.size.height + self.titleLineView.frame.origin.y,self.frame.size.width / 2,110}];
    [self.anchorBgView addSubview:self.myPriceRightBoxView];
    
    self.priceBoxBottomView = [[UIView alloc]initWithFrame:(CGRect){0,self.myPriceLeftBoxView.frame.size.height + self.myPriceLeftBoxView.frame.origin.y, self.frame.size.width,0.5}];
    self.priceBoxBottomView.backgroundColor = [UIColor colorFromConfigColor:XJAuxiliaryInsideSeparationColor];
    [self.anchorBgView addSubview:self.priceBoxBottomView];
    
    self.incomeManageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.incomeManageButton.frame = (CGRect){0,self.priceBoxBottomView.frame.size.height + self.priceBoxBottomView.frame.origin.y,self.frame.size.width / 2,60};
    [self.incomeManageButton setTitle:@"收入管理" forState:UIControlStateNormal];
    [self.incomeManageButton addTarget:self action:@selector(incomeManageButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    self.incomeManageButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [self.incomeManageButton setTitleColor:[UIColor colorFromHexString:@"#ffa200"] forState:UIControlStateNormal];
    self.incomeManageButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.anchorBgView addSubview:self.incomeManageButton];
    
    self.incomeMangeCenterView = [[UIView alloc]initWithFrame:(CGRect){self.frame.size.width / 2 ,self.priceBoxBottomView.frame.size.height + self.priceBoxBottomView.frame.origin.y + 15,0.5,30}];
    self.incomeMangeCenterView.backgroundColor = [UIColor colorFromConfigColor:XJAuxiliaryInsideSeparationColor];
    [self.anchorBgView addSubview:self.incomeMangeCenterView];
    [self.anchorBgView bringSubviewToFront:self.incomeMangeCenterView];
    
    self.priceSettingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.priceSettingButton.frame = (CGRect){self.frame.size.width / 2,self.priceBoxBottomView.frame.size.height + self.priceBoxBottomView.frame.origin.y,self.frame.size.width / 2,60};
    [self.priceSettingButton setTitle:@"主播设置" forState:UIControlStateNormal];
    [self.priceSettingButton addTarget:self action:@selector(priceSettingButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    self.priceSettingButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [self.priceSettingButton setTitleColor:[UIColor colorFromHexString:@"#ffa200"] forState:UIControlStateNormal];
    self.priceSettingButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.anchorBgView addSubview:self.priceSettingButton];
}

- (void)chargeView {
    
    self.chargeBgView = [[UIView alloc]initWithFrame:(CGRect){0,self.anchorBgView.frame.size.height + self.anchorBgView.frame.origin.y + 13,self.frame.size.width,60}];
    self.chargeBgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.chargeBgView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:(CGRect){25,0,self.frame.size.width,60}];
    self.titleLabel.text = @"我的钱包";
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.chargeBgView addSubview:self.titleLabel];
    
    self.chargeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.chargeButton.frame = (CGRect){self.frame.size.width - 102,12,77,35};
    [self.chargeButton setTitle:@"去充值" forState:UIControlStateNormal];
    [self.chargeButton addTarget:self action:@selector(chargeButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    self.chargeButton.layer.cornerRadius = 8;
    self.chargeButton.backgroundColor = [UIColor colorFromConfigColor:XJMyYellowColor];
    [self.chargeBgView addSubview:self.chargeButton];
    
    self.numberLabel = [[UILabel alloc]initWithFrame:(CGRect){0,0,self.frame.size.width - self.chargeButton.frame.size.width - 35,60}];
    self.numberLabel.textAlignment = NSTextAlignmentRight;
    self.numberLabel.text = @"1374749金币";
    self.numberLabel.textColor = [UIColor colorFromConfigColor:XJMyYellowColor];
    [self.chargeBgView addSubview:self.numberLabel];
    
}

- (void)chargeButtonOnclick {
    debug(@"chargeButtonOnclick去充值点击");
}

- (void)incomeManageButtonOnclick {
    debug(@"incomeManageButtonOnclick收入管理点击");
}

- (void)priceSettingButtonOnclick {
    debug(@"priceSettingButtonOnclick主播设置点击");
}

@end
