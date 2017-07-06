//
//  XJGirlDetailImageCollectionViewCell.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/5.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJGirlDetailImageCollectionViewCell.h"

@interface XJGirlDetailImageCollectionViewCell()

@property (nonatomic,strong)UIImageView *picView;
@end
@implementation XJGirlDetailImageCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

#pragma mark - setup
- (void)setupViews{
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.picView];
}

- (void)setupLayOut{
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    self.picView.layer.masksToBounds = YES;
    self.picView.layer.cornerRadius = 3.f;
    self.picView.frame = CGRectMake(0, 0, width, height);
}

- (void)setImageUrlString:(NSString *)imageUrlString{
    
    _imageUrlString = [imageUrlString copy];
    [self.picView sd_setImageWithURL:[NSURL URLWithString:_imageUrlString] placeholderImage:[UIImage imageNamed:@""]];
    [self setupLayOut];
}

#pragma mark - setter and getter
- (UIImageView *)picView{
    
    if (!_picView) {
        _picView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _picView.userInteractionEnabled = YES;
    }
    return _picView;
}

@end
