//
//  NSString+Size.h
//  NearBar
//
//  Created by zhanghb on 15/1/2.
//  Copyright (c) 2015年 zhanghb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;
/**
 *  添加混合中文计算的字符串长度
 */
-(NSUInteger) unicodeLengthOfString;


/**
 *  md5 加密的方法
 *
 *  @param input 输入描述
 *
 *  @return 返回值
 */
+ (NSString *)md5HexDigest:(NSString*)input;

/**
 *  验证email
 *
 *  @return 返回是否是email
 */
+ (BOOL) validateEmail:(NSString *)email;
/**
 *  验证是否是手机号
 *
 *  @return 返回是否是手机号
 */
+ (BOOL) validateMobile:(NSString *)phoneNum;

/**
 *  验证是否是QQ
 *
 *  @return 返回是否是QQ号码
 */
+ (BOOL) validateQQ:(NSString *)qqStr;
/**
 *  AES 加密
 *
 *  @param initStr   初始化string
 *  @param secretKeyParam 解密的string
 *
 *  @return 返回加密后的string
 */
+ (NSString *)encodeAESByKey:(NSString *)initStr secretKeyParam:(NSString *)secretKeyParam;

/**
 *  给加密后的字符串解密
 *
 *  @param decryptedStr 解密
 *
 *  @return 返回解密后的字符串
 */
+ (NSString *)decryptedAES:(NSString *)decryptedStr secretKey:(NSString *)secretKey;
/**
 *  过滤指定的Html标签
 *
 *  @param html html内容
 *
 *  @return 返回描述
 */
+ (NSString *)filterSpecifyHtml:(NSString *)html;

/**
 *  判断是否包含html
 *
 *  @param html 标签内容
 *
 *  @return 返回包含的文本
 */
+ (BOOL)isIncludeHtml:(NSString *)html;
@end
