//
//  XJNetApiManager.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/3.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJNetApiManager.h"

@implementation XJNetApiManager

+ (instancetype)sharedManager
{
    static XJNetApiManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    return _manager;
}

- (void)request_register_params:(NSDictionary *)params block:(void(^)(id data, NSError *error))blk{
    
    [[XJNetWorkClient shareClient] requestDictDataWithUrl:RegisterService requestMethod:POST param:params block:^(id object, NSError *error) {
        blk(object, error);
    }];
}

//首页热点
- (void)request_homepagehot_params:(NSDictionary *)params block:(void(^)(id data, NSError *error))blk{
    [[XJNetWorkClient shareClient] requestDictDataWithUrl:HomePageHotService requestMethod:GET param:params block:^(id object, NSError *error) {
        blk(object, error);
    }];
}
//滚动条
- (void)request_homeAds_params:(NSDictionary *)params block:(void(^)(id data, NSError *error))blk{
    
    [[XJNetWorkClient shareClient] requestDictDataWithUrl:HomeAdsService requestMethod:GET param:params block:^(id object, NSError *error) {
        blk(object, error);
    }];
}

@end
