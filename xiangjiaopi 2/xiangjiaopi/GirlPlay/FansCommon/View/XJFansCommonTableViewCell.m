//
//  XJFansCommonTableViewCell.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/5.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJFansCommonTableViewCell.h"

@interface XJFansCommonTableViewCell()
@property (nonatomic,strong)UIImageView *avaterImageView;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIButton *sexBtn;
@property (nonatomic,strong)UIButton *onLineBtn;
@property (nonatomic,strong)UIImageView *lablesImageView;
@property (nonatomic,strong)UILabel *lablesLbl;
@property (nonatomic,strong)UIImageView *lineImageView;
@end

@implementation XJFansCommonTableViewCell
#pragma mark – life cycle
+ (XJFansCommonTableViewCell *)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"XJFansCommonTableViewCell";
    XJFansCommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        //这里使用系统自带的样式
        cell = [[XJFansCommonTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
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
    
    [self.contentView addSubview:self.avaterImageView];
    [self.contentView addSubview:self.titleLbl];
    [self.contentView addSubview:self.sexBtn];
    [self.contentView addSubview:self.onLineBtn];
    [self.contentView addSubview:self.lablesImageView];
    [self.contentView addSubview:self.lablesLbl];
    [self.contentView addSubview:self.lineImageView];
}

- (void)setupData{
    
    if (self.itemModel) {
        [self.avaterImageView sd_setImageWithURL:[NSURL URLWithString:self.itemModel.avator] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
        }];
        self.titleLbl.text = self.itemModel.username;
        if ([self.itemModel.sex integerValue] == 1) {//男
            [self.sexBtn setTitle:@"男" forState:UIControlStateNormal];
            self.sexBtn.layer.borderColor = [UIColor hexStringToColor:@"4390fb"].CGColor;
            [self.sexBtn setTitleColor:[UIColor hexStringToColor:@"4390fb"] forState:UIControlStateNormal];
        } else if ([self.itemModel.sex integerValue] == 2){
            [self.sexBtn setTitle:@"女" forState:UIControlStateNormal];
            self.sexBtn.layer.borderColor = [UIColor hexStringToColor:@"fb86a7"].CGColor;
            [self.sexBtn setTitleColor:[UIColor hexStringToColor:@"fb86a7"]forState:UIControlStateNormal];
        }
        if ([self.itemModel.is_online integerValue] == 1) {
            self.onLineBtn.hidden = NO;
        } else {
            self.onLineBtn.hidden = YES;
        }
        __block NSString * labelsStr = @"";
        if (self.itemModel.lables.count) {
            [self.itemModel.lables enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (idx == 0) {
                    labelsStr = obj;
                } else {
                    labelsStr = [labelsStr stringByAppendingString:@"、"];
                    labelsStr =[labelsStr stringByAppendingString:obj];
                }
            }];
        }
        self.lablesLbl.text = labelsStr;
    }
}

- (void)setupFrames{
    
    CGFloat Margin = 15.f;
    CGFloat imageWH = XJFansCommonTableViewCellH - Margin *2;
    self.avaterImageView.frame = CGRectMake(Margin, Margin, imageWH, imageWH);
    CGFloat titleAndBtnH = 18.f;
    CGFloat btnW = 39.f;
    CGFloat titleLeftMargin = 16.f;
    CGFloat btnMargin = 5.f;
    CGFloat imageRightMargin = CGRectGetMaxX(self.avaterImageView.frame) + titleLeftMargin;
    CGFloat titleMax = SCREEN_WIDTH - 2*Margin - 2 * btnW - btnMargin;
    CGSize titleSize = [self.titleLbl.text sizeWithFont:self.titleLbl.font maxW:titleMax];
    self.titleLbl.frame = CGRectMake(imageRightMargin, Margin, titleSize.width, titleAndBtnH);
    self.sexBtn.frame = CGRectMake(CGRectGetMaxX(self.titleLbl.frame) +btnMargin, Margin, btnW, titleAndBtnH);
    self.onLineBtn.frame = CGRectMake(CGRectGetMaxX(self.sexBtn.frame) +btnMargin, Margin, btnW, titleAndBtnH);
    CGFloat labelsTopMargin = 15.f;
    CGFloat labelsImageWH = 15.f;
    self.lablesImageView.frame = CGRectMake(imageRightMargin, labelsTopMargin + CGRectGetMaxY(self.titleLbl.frame), labelsImageWH, labelsImageWH);
    CGFloat lablsrightMargin = 5.f;
    CGFloat lablesMax = SCREEN_WIDTH - Margin - CGRectGetMaxX(self.lablesImageView.frame) -lablsrightMargin;
    CGSize lablesSize = [self.lablesLbl.text sizeWithFont:self.lablesLbl.font maxW:lablesMax];
    CGFloat lableLblH = 17.f;
    self.lablesLbl.frame = CGRectMake(CGRectGetMaxX(self.lablesImageView.frame) +lablsrightMargin, CGRectGetMaxY(self.titleLbl.frame) + labelsTopMargin, lablesSize.width, lableLblH);
    self.lineImageView.frame = CGRectMake(Margin, XJFansCommonTableViewCellH -0.5, SCREEN_WIDTH - Margin, 0.5);
}

#pragma mark - set model
- (void)setItemModel:(XJFansCommonItemModel *)itemModel{

    _itemModel = itemModel;
    [self setupData];
    [self setupFrames];
}


#pragma mark - setter and getter

-(UIImageView *)avaterImageView{
    
    if (!_avaterImageView) {
        _avaterImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _avaterImageView.backgroundColor = [UIColor redColor];
    }
    return _avaterImageView;
}

- (UILabel *)titleLbl{
    
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLbl.font = [UIFont systemFontOfSize:16];
        _titleLbl.textColor = [UIColor blackColor];
        _titleLbl.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLbl;
}

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

- (UIImageView *)lablesImageView{
    
    if (!_lablesImageView) {
        _lablesImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _lablesImageView.backgroundColor = [UIColor redColor];
    }
    return _lablesImageView;
}

- (UILabel *)lablesLbl{
    
    if (!_lablesLbl) {
        _lablesLbl = [[UILabel alloc]initWithFrame:CGRectZero];
        _lablesLbl.textAlignment = NSTextAlignmentLeft;
        _lablesLbl.numberOfLines = 1;
        _lablesLbl.textColor = [UIColor hexStringToColor:@"fb86a7"];
        _lablesLbl.font = [UIFont systemFontOfSize:12];
    }
    return _lablesLbl;
}

- (UIImageView *)lineImageView{
    
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _lineImageView.backgroundColor = [UIColor hexStringToColor:@"efefef"];
    }
    return _lineImageView;
}
@end
