//
//  XJMyTableViewCell.m
//  xiangjiaopi
//
//  Created by 冯喆 on 2017/7/10.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJMyTableViewCell.h"

@interface XJMyTableViewCell ()

@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UIView *bottomView;
@property (nonatomic, strong)UILabel *iconLabel;

@end

@implementation XJMyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.titleLabel = [[UILabel alloc]initWithFrame:(CGRect){25,0,App.window.frame.size.width,60}];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.font = [UIFont fontWithName:@"" size:18];
        [self addSubview:self.titleLabel];
        
        self.bottomView = [[UIView alloc]initWithFrame:(CGRect){0,59.5,self.frame.size.width,0.5}];
        self.bottomView.backgroundColor = [UIColor colorFromConfigColor:XJAuxiliaryInsideSeparationColor];
        [self addSubview:self.bottomView];
        
        self.iconLabel = [[UILabel alloc]initWithFrame:(CGRect){App.window.frame.size.width - 45,15,25,30}];
        self.iconLabel.font = [UIFont fontWithName:@"iconfont" size:17];
        self.iconLabel.text = @"\U0000e649";
        self.iconLabel.textColor = [UIColor colorFromHexString:@"#7f7f7f"];
        [self addSubview:self.iconLabel];
    }
    
    return self;
}

- (void)settitleLabelText:(NSString *)text {
    self.titleLabel.text = text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
