//
//  XJGirlPlayHomeContentTableViewCell.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/4.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJGirlPlayHomeContentTableViewCell.h"

@interface XJGirlPlayHomeContentTableViewCell()

@property (nonatomic,strong)UIImageView *avaterImageView;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIButton *sexBtn;
@property (nonatomic,strong)UIButton *onLineBtn;
@property (nonatomic,strong)UILabel *distanceLbl;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)UIImageView *lablesImageView;
@property (nonatomic,strong)UILabel *lablesLbl;
@property (nonatomic,strong)UIButton *playBtn;
@property (nonatomic,strong)UIButton *callBtn;
@property (nonatomic,strong)UILabel *descLbl;
@property (nonatomic,strong)UILabel *orderCountLbl;
@property (nonatomic,strong)UIImageView *lineImageView;
@end


@implementation XJGirlPlayHomeContentTableViewCell

#pragma mark – life cycle
+ (XJGirlPlayHomeContentTableViewCell *)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"XJGirlPlayHomeContentTableViewCell";
    XJGirlPlayHomeContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        //这里使用系统自带的样式
        cell = [[XJGirlPlayHomeContentTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
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
    [self.contentView addSubview:self.distanceLbl];
    [self.contentView addSubview:self.timeLbl];
    [self.contentView addSubview:self.lablesImageView];
    [self.contentView addSubview:self.lablesLbl];
    [self.contentView addSubview:self.playBtn];
    [self.contentView addSubview:self.callBtn];
    [self.contentView addSubview:self.descLbl];
    [self.contentView addSubview:self.orderCountLbl];
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
        self.distanceLbl.text = self.itemModel.location_name;
        self.timeLbl.text = self.itemModel.friendly_time;
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
        [self.callBtn setTitle:[NSString stringWithFormat:@"%@币／分",[self.itemModel.per_money stringValue]] forState:UIControlStateNormal];
        self.descLbl.text = self.itemModel.desc;
        self.orderCountLbl.text = [NSString stringWithFormat:@"已接%@单",[self.itemModel.order_nums stringValue]];
    }
}

- (void)setupFrames{
    
    CGFloat topMargin = 13.f;
    CGFloat imageWH = XJGirlPlayHomeContentTableViewCellH - topMargin *2;
    self.avaterImageView.frame = CGRectMake(topMargin, topMargin, imageWH, imageWH);
    CGFloat titleAndBtnH = 18.f;
    CGSize timeSize = [self.timeLbl.text sizeWithFont:self.timeLbl.font];
    self.timeLbl.frame = CGRectMake(SCREEN_WIDTH - topMargin - timeSize.width, topMargin, timeSize.width, titleAndBtnH);
    
    CGFloat timeLeftMargin = 12.f;
    CGSize localSize = [self.distanceLbl.text sizeWithFont:self.distanceLbl.font];
    self.distanceLbl.frame = CGRectMake(CGRectGetMinX(self.timeLbl.frame) - timeLeftMargin - localSize.width, topMargin, localSize.width, titleAndBtnH);
    
    CGFloat btnW = 39.f;
    CGFloat titleLeftMargin = 16.f;
    CGFloat btnMargin = 5.f;
    CGFloat imageRightMargin = CGRectGetMaxX(self.avaterImageView.frame) + titleLeftMargin;
    CGFloat titleMax = CGRectGetMinX(self.distanceLbl.frame) - topMargin - titleLeftMargin - imageWH - 2 * btnW - 2*btnMargin;
    CGSize titleSize = [self.titleLbl.text sizeWithFont:self.titleLbl.font maxW:titleMax];
    self.titleLbl.frame = CGRectMake(imageRightMargin, topMargin, titleSize.width, titleAndBtnH);
    self.sexBtn.frame = CGRectMake(CGRectGetMaxX(self.titleLbl.frame) +btnMargin, topMargin, btnW, titleAndBtnH);
    self.onLineBtn.frame = CGRectMake(CGRectGetMaxX(self.sexBtn.frame) +btnMargin, topMargin, btnW, titleAndBtnH);
    CGFloat labelsTopMargin = 10.f;
    CGFloat labelsImageWH = 15.f;
    self.lablesImageView.frame = CGRectMake(imageRightMargin, labelsTopMargin + CGRectGetMaxY(self.titleLbl.frame), labelsImageWH, labelsImageWH);
    
    CGFloat callBtnWH = 60.f;
    CGFloat callBtnRightMargin = 13.f;
    CGFloat callBtnTopMargin = 11.f;
    self.callBtn.frame = CGRectMake(SCREEN_WIDTH - callBtnWH - callBtnRightMargin, CGRectGetMaxY(self.titleLbl.frame) + callBtnTopMargin, callBtnWH, callBtnWH);
    CGFloat lablsrightMargin = 5.f;
    CGFloat lablesMax = CGRectGetMinX(self.callBtn.frame) - CGRectGetMaxX(self.lablesImageView.frame) -lablsrightMargin;
    CGSize lablesSize = [self.lablesLbl.text sizeWithFont:self.lablesLbl.font maxW:lablesMax];
    CGFloat lableLblH = 17.f;
    self.lablesLbl.frame = CGRectMake(CGRectGetMaxX(self.lablesImageView.frame) +lablsrightMargin, CGRectGetMaxY(self.titleLbl.frame) + labelsTopMargin, lablesSize.width, lableLblH);
    CGFloat playBtnW = 66.f;
    CGFloat playBtnH = 28.f;
    self.playBtn.frame = CGRectMake(imageRightMargin, CGRectGetMaxY(self.lablesLbl.frame) + labelsTopMargin, playBtnW, playBtnH);
    CGSize orderSize = [self.orderCountLbl.text sizeWithFont:self.orderCountLbl.font];
    CGFloat orderTopMargin = 10.f;
    self.orderCountLbl.frame = CGRectMake(SCREEN_WIDTH - orderSize.width - topMargin, CGRectGetMaxY(self.callBtn.frame) + orderTopMargin, orderSize.width, orderSize.height);
    CGFloat descMax = CGRectGetMinX(self.orderCountLbl.frame) - imageRightMargin;
    CGSize descSize = [self.descLbl.text sizeWithFont:self.descLbl.font maxW:descMax];
    CGFloat descLblH = 20.f;
    self.descLbl.frame = CGRectMake(imageRightMargin, CGRectGetMaxY(self.playBtn.frame) + callBtnTopMargin, descSize.width, descLblH);
    self.lineImageView.frame = CGRectMake(topMargin, XJGirlPlayHomeContentTableViewCellH -0.5, SCREEN_WIDTH - topMargin, 0.5);
}

#pragma mark -setdata
- (void)setItemModel:(XJGirlPlayHomeContentItemModel *)itemModel{

    _itemModel = itemModel;
    [self setupData];
    [self setupFrames];
}

#pragma mark - action
- (void)playBtnClick:(UIButton *)btn{

    if (self.playBlock) {
        self.playBlock(self.itemModel);
    }
}

- (void)callBtnClick:(UIButton *)btn{

    if (self.callBlock) {
        self.callBlock(self.itemModel);
    }
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

- (UILabel *)distanceLbl{

    if (!_distanceLbl) {
        _distanceLbl = [[UILabel alloc]initWithFrame:CGRectZero];
        _distanceLbl.font = [UIFont systemFontOfSize:14];
        _distanceLbl.textColor = [UIColor hexStringToColor:@"8d8d8d"];
        _distanceLbl.textAlignment = NSTextAlignmentLeft;
    }
    return _distanceLbl;
}

- (UILabel *)timeLbl{

    if (!_timeLbl) {
        _timeLbl = [[UILabel alloc]initWithFrame:CGRectZero];
        _timeLbl.font = [UIFont systemFontOfSize:14];
        _timeLbl.textColor = [UIColor hexStringToColor:@"8d8d8d"];
        _timeLbl.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLbl;
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

- (UIButton *)playBtn{

    if (!_playBtn) {
        _playBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_playBtn addTarget:self action:@selector(playBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_playBtn setBackgroundColor:[UIColor greenColor]];
    }
    return _playBtn;
}

- (UIButton *)callBtn{

    if (!_callBtn) {
        _callBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_callBtn addTarget:self action:@selector(callBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_callBtn setBackgroundColor:[UIColor greenColor]];
    }
    return _callBtn;
}

- (UILabel *)descLbl{

    if (!_descLbl) {
        _descLbl =  [[UILabel alloc]initWithFrame:CGRectZero];
        _descLbl.font = [UIFont systemFontOfSize:14];
        _descLbl.textAlignment = NSTextAlignmentLeft;
        _descLbl.textColor = [UIColor hexStringToColor:@"8d8d8d"];
    }
    return _descLbl;
}

- (UILabel *)orderCountLbl{

    if (!_orderCountLbl) {
        _orderCountLbl = [[UILabel alloc]initWithFrame:CGRectZero];
        _orderCountLbl.font = [UIFont systemFontOfSize:12];
        _orderCountLbl.textAlignment = NSTextAlignmentLeft;
        _orderCountLbl.textColor = [UIColor hexStringToColor:@"8d8d8d"];
    }
    return _orderCountLbl;
}

- (UIImageView *)lineImageView{

    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _lineImageView.backgroundColor = [UIColor hexStringToColor:@"efefef"];
    }
    return _lineImageView;
}
@end
