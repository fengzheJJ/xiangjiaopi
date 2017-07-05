//
//  GirlPlayHomeContentItemModel.h
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/4.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
//{
//    "user_id": 3,
//    "username": "光之夏日",
//    "avator": "http://jieyou.img.toutiaowangdai.com/@/2333/234/234/2342343.jgp",
//    "sex": 1,
//    "desc": "",
//    "radio_desc_url": "http://jieyou.mp3.toutiaowangdai.com/@/123/234/234.mp3",
//    "act_time": 0,
//    "per_money": 9,
//    "is_online": 1,
//    "age": 29,
//    "is_sy": 0,
//    "radio_long": 12,
//    "lon": 123.343433,
//    "lat": 45.234214,
//    "order_nums": 5,
//    "location_name": "7km",
//    -"lables": [
//                "大凶妹",
//                "大长腿"
//                ],
//    "friendly_time": "2 天前"
//}
@interface XJGirlPlayHomeContentItemModel : NSObject

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
