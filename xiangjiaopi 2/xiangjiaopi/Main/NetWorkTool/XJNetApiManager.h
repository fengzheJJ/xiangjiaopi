//
//  XJNetApiManager.h
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/3.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJNetService.h"
#import "XJNetWorkClient.h"

@interface XJNetApiManager : NSObject

+ (instancetype)sharedManager;

#pragma mark - request
//注册
- (void)request_register_params:(NSDictionary *)params block:(void(^)(id data, NSError *error))blk;

//首页热点
- (void)request_homepagehot_params:(NSDictionary *)params block:(void(^)(id data, NSError *error))blk;
//滚动条
- (void)request_homeAds_params:(NSDictionary *)params block:(void(^)(id data, NSError *error))blk;
@end
