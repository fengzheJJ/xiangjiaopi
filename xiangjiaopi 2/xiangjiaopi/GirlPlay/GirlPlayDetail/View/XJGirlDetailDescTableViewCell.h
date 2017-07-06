//
//  XJGirlDetailDescTableViewCell.h
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/5.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJGirlDetailDescTableViewCell : UITableViewCell

@property (nonatomic,strong)id object;

+ (XJGirlDetailDescTableViewCell *)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)cellHeightWithObject:(id)object;
@end
