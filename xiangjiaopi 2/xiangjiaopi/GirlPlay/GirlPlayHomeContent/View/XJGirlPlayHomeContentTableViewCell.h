//
//  XJGirlPlayHomeContentTableViewCell.h
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/4.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJGirlPlayHomeContentItemModel.h"

#define XJGirlPlayHomeContentTableViewCellH (189)

typedef void(^XJGirlPlayHomeContentTableViewCellPlayBlock)(XJGirlPlayHomeContentItemModel * itemModel);
typedef void(^XJGirlPlayHomeContentTableViewCellCallBlock)(XJGirlPlayHomeContentItemModel * itemModel);

@interface XJGirlPlayHomeContentTableViewCell : UITableViewCell

@property (nonatomic,strong)XJGirlPlayHomeContentItemModel *itemModel;

@property (nonatomic,copy)XJGirlPlayHomeContentTableViewCellPlayBlock playBlock;

@property (nonatomic,copy)XJGirlPlayHomeContentTableViewCellCallBlock callBlock;

+ (XJGirlPlayHomeContentTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
