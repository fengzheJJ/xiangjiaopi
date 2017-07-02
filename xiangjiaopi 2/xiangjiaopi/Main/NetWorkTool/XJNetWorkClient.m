//
//  XJNetWorkClient.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/2.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJNetWorkClient.h"
#import "NSString+Additional.h"
#import "NSDictionary+NetworkingMethods.h"

#define Md5Salt @""

static XJNetWorkClient *_client = nil;

@interface XJNetWorkClient ()

@property (nonatomic, strong) NSMutableDictionary *dic;

@end

@implementation XJNetWorkClient
#pragma mark - Init

+ (instancetype)shareClient {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _client = [[XJNetWorkClient alloc] initWithBaseURL:nil];
    });
    return _client;
}


- (instancetype)initWithBaseURL:(NSURL *)url {
    return [self initWithBaseURL:url sessionConfiguration:nil];
}

- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration {
    self = [super initWithBaseURL:url sessionConfiguration:configuration];
    if (self) {
        
        _dic = [NSMutableDictionary dictionary];
        
        // request
        /**
         *  这里服务器要求是form表单提交
         *  @Content-Type --> application/x-www-form-urlencoded
         *  https://imququ.com/post/four-ways-to-post-data-in-http.html
         */
        
        self.requestSerializer.timeoutInterval = 20;
        // response
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"application/json", @"text/json", @"text/javescript", @"text/html", @"iamge/jpeg", @"image/png", nil];
        //        self.responseSerializer = [AFJSONResponseSerializer serializer];
        // self.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}

#pragma mark - Public

- (void)requestJsonDataWithUrl:(NSString *)url
                 requestMethod:(RequestMethod)method
                         param:(NSDictionary *)param
                         block:(void (^)(id object, NSError *error))blk {
    [self requestJsonDataWithUrl:url requestMethod:method param:param autoShowErrorMsg:YES block:blk];
}

- (void)requestJsonDataWithUrl:(NSString *)url
                 requestMethod:(RequestMethod)method
                         param:(NSDictionary *)param
              autoShowErrorMsg:(BOOL)autoShowErrorMsg
                         block:(void (^)(id object, NSError *error))blk {
    
    url = [API_BASE_URL stringByAppendingString:url];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //检测当前请求是否正在进行
    NSString *key = [[NSString stringWithFormat:@"url %@ method %lu para %@", url, (unsigned long)method, param] md5Str];
    if ([self.dic objectForKey:key]) {
        return;
    }
    [self.dic setObject:@"1122" forKey:key];
    //添加公共参数 可以对特定的接口做特定的处理 不添加common参数
    //设置通用参数
    NSDictionary *commonParams = [self appendVerifyInfo:param apiType:VertifyParamsNormal];
    
    [self showLoading];
    
    switch (method) {
        case GET: {
            [self GET:url parameters:commonParams progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                MyLog(@"\n===========response===========\n%@$\n%@", url, responseObject);
                
                __autoreleasing NSError *error = nil;
                [self handleResponseWithObj:responseObject autoShowErrorMsg:autoShowErrorMsg error:&error];
                if (error) {
                    blk(nil, error);
                } else {
                    blk(responseObject, nil);
                }
                
                [self hideLoading];
                [self.dic removeObjectForKey:key];
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                MyLog(@"\n===========response===========\n%@$\n%@", url, error);
                
                if (autoShowErrorMsg) {
                    [self showNetWorkError:error];
                }
                blk(nil, error);
                
                [self hideLoading];
                [self.dic removeObjectForKey:key];
                
                
            }];
            break;
        }
        case POST: {
            
            [self POST:url parameters:commonParams progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                MyLog(@"\n===========response===========\n%@$\n%@", url, responseObject);
                
                __autoreleasing NSError *error = nil;
                [self handleResponseWithObj:responseObject autoShowErrorMsg:autoShowErrorMsg error:&error];
                if (error) {
                    blk(nil, error);
                } else {
                    blk(responseObject, nil);
                }
                
                [self hideLoading];
                [self.dic removeObjectForKey:key];
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                MyLog(@"\n===========response===========\n%@$\n%@", url, error);
                
                if (autoShowErrorMsg) {
                    [self showNetWorkError:error];
                }
                blk(nil, error);
                
                [self hideLoading];
                [self.dic removeObjectForKey:key];
                
            }];
            break;
        }
            
        default:
            break;
    }
    
}

- (void)requsetUploadDataWithUrl:(NSString *)url
                            para:(NSDictionary *)para
                            data:(NSData *)data
                            name:(NSString *)name
                        fileName:(NSString *)fileName
                        progress:(void (^)(NSProgress *))progress
                           block:(void (^)(id, NSError *))blk
{
    url = [API_BASE_URL stringByAppendingString:url];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //检测当前请求是否正在进行
    NSString *key = [[NSString stringWithFormat:@"url %@ method POST para %@", url, para] md5Str];
    if ([self.dic objectForKey:key]) {
        return;
    }
    [self.dic setObject:@"1122" forKey:key];
    
    //添加公共参数 可以对特定的接口做特定的处理 不添加common参数
    //设置通用参数
    NSDictionary *commonParams = [self appendVerifyInfo:para apiType:VertifyParamsNormal];
    [self showLoading];
    
    
    [self POST:url parameters:commonParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress);
        
        //CGFloat progress = ((float)uploadProgress.completedUnitCount / (float)uploadProgress.totalUnitCount) * 100.0;
        
        //DEBUGLog(@"上传进度progress = %.2f%%", progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        MyLog(@"\n===========response===========\n%@$\n%@", url, responseObject);
        
        __autoreleasing NSError *error = nil;
        [self handleResponseWithObj:responseObject autoShowErrorMsg:NO error:&error];
        if (error) {
            blk(nil, error);
        } else {
            blk(responseObject, nil);
        }
        
        [self hideLoading];
        [self.dic removeObjectForKey:key];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        MyLog(@"\n===========response===========\n%@$\n%@", url, error);
        
        //        if (NO) {
        //            [self showNetWorkError:error];
        //        }
        blk(nil, error);
        
        [self hideLoading];
        [self.dic removeObjectForKey:key];
        
        
    }];
}

#pragma mark - 错误提示

- (void)showNetWorkError:(NSError *)error {
    NSString *tipStr = nil;//[NSMutableString string];
    if (error.localizedDescription) {
        tipStr = error.localizedDescription;
    } else {
        tipStr = [NSString stringWithFormat:@"ErrorCode%ld",(long)error.code];
    }
    [NSObject showToastWithString:tipStr];
}


- (void)handleResponseWithObj:(id)obj error:(NSError **)error {
    [self handleResponseWithObj:obj autoShowErrorMsg:YES error:error];
}


- (void)handleResponseWithObj:(id)obj autoShowErrorMsg:(BOOL)autoShowErrorMsg error:(NSError **)error {
    
    if ([obj[@"status"] intValue] != 1) {
        *error = [NSError errorWithDomain:@"Server response status error!" code:[obj[@"status"] integerValue] userInfo:obj];
        
        NSString *message = obj[@"message"];
        if (autoShowErrorMsg && [message isNotEmpty]) {
            [NSObject showToastWithString:message];
        }
    }
}


- (void)showLoading {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)hideLoading {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma mark - params
/**
 * 根据get or post请求获取common参数
 */
- (NSDictionary *)appendVerifyInfo:(NSDictionary *)params apiType:(NSUInteger)apiTpye
{
    //如果是post请求，不需要把请求参数传入url
    NSMutableDictionary *requestParams = [NSMutableDictionary new];
    if (params) {
        [requestParams addEntriesFromDictionary:params];
    }
    
    //设置通用参数
    if (apiTpye == VertifyParamsNormal) {//如果是normal 则认为需要公共参数
        requestParams[@"osType"] = kOsType;
        UIDevice *device = [UIDevice currentDevice];
        //获取系统版本
        NSString *systemVersion = device.systemVersion;
        requestParams[@"osVersion"] = systemVersion;
    }
    requestParams[@"sign"] = [self getSignStr:requestParams];
    
    return requestParams;
}


/**
 * 将请求参数requestParams，按照key值的字母顺序拼成如：userName=1234&password=1234的串，然后加salt取md5
 */
- (NSString *)getSignStr:(NSDictionary *)requestParams {
    NSString *signStr = @"";
    if (requestParams) {
        
        NSString *toMD5 = [requestParams combineDictionaryToString];
        toMD5 = [toMD5 stringByAppendingString:Md5Salt];
        signStr = [toMD5 md5Str];
    }
    return signStr;
}



@end
