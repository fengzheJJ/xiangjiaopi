//
//  FansCommonItemModel.h
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/5.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJFansCommonItemModel : NSObject

@property (nonatomic,strong)NSNumber * user_id;
@property (nonatomic,copy)NSString * username;
@property (nonatomic,copy)NSString * avator;
@property (nonatomic,strong)NSNumber * sex;
@property (nonatomic,copy)NSString * desc;
@property (nonatomic,copy)NSString * radio_desc_url;
@property (nonatomic,strong)NSNumber * act_time;
@property (nonatomic,strong)NSNumber * per_money;
@property (nonatomic,strong)NSNumber * is_online;
@property (nonatomic,strong)NSNumber * age;
@property (nonatomic,strong)NSNumber * is_sy;
@property (nonatomic,strong)NSNumber * radio_long;
@property (nonatomic,strong)NSNumber * lon;
@property (nonatomic,strong)NSNumber * lat;
@property (nonatomic,strong)NSNumber * order_nums;
@property (nonatomic,copy)NSString * location_name;
@property (nonatomic,strong)NSArray *lables;
@property (nonatomic,copy)NSString * friendly_time;
@end
