//
//  XJFansCommonTableViewCell.h
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/5.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJFansCommonItemModel.h"

#define XJFansCommonTableViewCellH (80.f)

@interface XJFansCommonTableViewCell : UITableViewCell

@property (nonatomic,strong)XJFansCommonItemModel *itemModel;

+ (XJFansCommonTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
