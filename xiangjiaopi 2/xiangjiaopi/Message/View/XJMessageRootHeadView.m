//
//  XJMessageRootHeadView.m
//  xiangjiaopi
//
//  Created by 冯喆 on 2017/7/6.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJMessageRootHeadView.h"

@interface XJMessageRootHeadView ()

@property (nonatomic, strong) NSArray * dataArray;

@end


@implementation XJMessageRootHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorFromConfigColor:XJMainBackgroundColor];
        [self setHeadButton];
        
    }
    return self;
}


- (void)setHeadButton {
    
    NSInteger index;
    self.dataArray = [NSArray arrayWithObjects:@"\U0000e65a 消息中心",@"\U0000e650 订单助手",@"\U0000e646 反馈助手", nil];
    for (index = 0; index < 3; index ++) {
        CGFloat Width = (self.frame.size.width - 50) / 3 ;
        UIButton * headButton = [UIButton buttonWithType:UIButtonTypeCustom];
        headButton.frame = CGRectMake(15 + (Width + 10) *index, 10, Width, 34);
        headButton.tag = 1000 + index;
        headButton.backgroundColor = [UIColor whiteColor];
        NSString *titleText = self.dataArray[index];
        headButton.layer.cornerRadius = 6;
        headButton.layer.borderColor = [UIColor colorFromConfigColor:XJMessageSeparationColor].CGColor;
        headButton.layer.borderWidth = 0.5;
        headButton.titleLabel.font = [UIFont fontWithName:@"iconfont" size:16];
        [headButton setTitle:titleText forState:UIControlStateNormal];
        [headButton setTitleColor:[UIColor colorFromConfigColor:XJTextMainTitleColor] forState:UIControlStateNormal];
        [headButton addTarget:self action:@selector(headButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:headButton];
        
        UIView * redView = [[UIView alloc]initWithFrame:(CGRect){Width - 12,4,8,8}];
        redView.backgroundColor = [UIColor redColor];
        redView.layer.cornerRadius = 4;
        [headButton addSubview:redView];
        
    }
}

- (void)headButtonOnclick:(UIButton *)button {
    NSInteger index = button.tag - 1000;
    debug(@"%ld",(long)index);
}

@end
