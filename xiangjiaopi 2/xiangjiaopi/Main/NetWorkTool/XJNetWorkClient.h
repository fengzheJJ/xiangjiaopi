//
//  XJNetWorkClient.h
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/2.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "XJNetService.h"



typedef NS_ENUM(NSUInteger, RequestMethod) {
    GET = 0,
    POST,
    DELETE,
};

typedef NS_ENUM(NSUInteger, VertifyParams) {
    VertifyParamsNormal = 0,//接口是否拼接公共参数
    VertifyParamsNO = 1,
};


@interface XJNetWorkClient : AFHTTPSessionManager

+ (instancetype)shareClient;


- (void)requestJsonDataWithUrl:(NSString *)url
                 requestMethod:(RequestMethod)method
                         param:(NSDictionary *)param
                         block:(void (^)(id object, NSError *error))blk;

- (void)requestJsonDataWithUrl:(NSString *)url
                 requestMethod:(RequestMethod)method
                         param:(NSDictionary *)param
              autoShowErrorMsg:(BOOL)autoShowErrorMsg
                         block:(void (^)(id object, NSError *error))blk;

- (void)requsetUploadDataWithUrl:(NSString *)url
                            para:(NSDictionary *)para
                            data:(NSData *)data
                            name:(NSString *)name
                        fileName:(NSString *)fileName
                        progress:(void (^)(NSProgress *))progress
                           block:(void (^)(id, NSError *))blk;
@end
