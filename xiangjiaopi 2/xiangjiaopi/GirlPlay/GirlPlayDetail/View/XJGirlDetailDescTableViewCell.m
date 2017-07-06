//
//  XJGirlDetailDescTableViewCell.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/5.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJGirlDetailDescTableViewCell.h"
#import "XJGirlDetailImageCollectionViewCell.h"
@interface XJGirlDetailDescTableViewCell ()

@property (nonatomic,strong)UICollectionView * collectionView;
@property (nonatomic,strong)UIButton *sexBtn;
@property (nonatomic,strong)UIButton *starBtn;
@property (nonatomic,strong)UIButton *localBtn;
@property (nonatomic,strong)UIButton *onLineBtn;
@property (nonatomic,strong)UIButton *playBtn;
@property (nonatomic,strong)UILabel * descLbl;
@end
@implementation XJGirlDetailDescTableViewCell
#pragma mark - life circle
#pragma mark – life cycle
+ (XJGirlDetailDescTableViewCell *)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"XJGirlDetailDescTableViewCell";
    XJGirlDetailDescTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        //这里使用系统自带的样式
        cell = [[XJGirlDetailDescTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

#pragma mark - setup
- (void)setupViews{

    [self.contentView addSubview:self.collectionView];
    [self.contentView addSubview:self.sexBtn];
    [self.contentView addSubview:self.onLineBtn];
    [self.contentView addSubview:self.localBtn];
    [self.contentView addSubview:self.starBtn];
    [self.contentView addSubview:self.playBtn];
    [self.contentView addSubview:self.descLbl];
}

- (void)setupFrames{

}

- (void)setupData{
    
    
}

- (void)setObject:(id)object{
    
    _object = object;
    [self setupData];
    [self setupFrames];
    [self.collectionView reloadData];
}

#pragma mark - setter and getter
- (UIButton *)sexBtn{
    
    if (!_sexBtn) {
        _sexBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        _sexBtn.userInteractionEnabled = NO;
        _sexBtn.layer.cornerRadius = 5.f;
        _sexBtn.layer.borderWidth = .5;
        _sexBtn.layer.borderColor = [UIColor hexStringToColor:@"f99f35"].CGColor;
    }
    return _sexBtn;
}

- (UIButton *)onLineBtn{
    
    if (!_onLineBtn) {
        _onLineBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        _onLineBtn.userInteractionEnabled = NO;
        [_onLineBtn setTitle:@"在线" forState:UIControlStateNormal];
        _onLineBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_onLineBtn setTitleColor:[UIColor hexStringToColor:@"f99f35"] forState:UIControlStateNormal];
        _onLineBtn.layer.cornerRadius = 5.f;
        _onLineBtn.layer.borderWidth = .5;
        _onLineBtn.layer.borderColor = [UIColor hexStringToColor:@"f99f35"].CGColor;
    }
    return _onLineBtn;
}

- (UIButton *)starBtn{

    if (!_starBtn) {
        _starBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        _starBtn.userInteractionEnabled = NO;
        [_starBtn setTitle:@"在线" forState:UIControlStateNormal];
        _starBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_starBtn setTitleColor:[UIColor hexStringToColor:@"f99f35"] forState:UIControlStateNormal];
        _starBtn.layer.cornerRadius = 5.f;
        _starBtn.layer.borderWidth = .5;
        _starBtn.layer.borderColor = [UIColor hexStringToColor:@"f99f35"].CGColor;
    }
    return _starBtn;
}

- (UIButton *)localBtn{

    if (!_localBtn) {
        _localBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        _localBtn.userInteractionEnabled = NO;
        [_localBtn setTitle:@"在线" forState:UIControlStateNormal];
        _localBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_localBtn setTitleColor:[UIColor hexStringToColor:@"f99f35"] forState:UIControlStateNormal];
        _localBtn.layer.cornerRadius = 5.f;
        _localBtn.layer.borderWidth = .5;
        _localBtn.layer.borderColor = [UIColor hexStringToColor:@"f99f35"].CGColor;
    }
    return _localBtn;
}

@end
