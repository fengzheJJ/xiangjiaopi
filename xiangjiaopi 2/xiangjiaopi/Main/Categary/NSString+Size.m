//
//  NSString+Size.m
//  NearBar
//
//  Created by zhanghb on 15/1/2.
//  Copyright (c) 2015年 zhanghb. All rights reserved.
//

#import "NSString+Size.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSData+CommonCrypto.h"
#import "GTMBase64.h"

@implementation NSString (Size)
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT];
}

/**
 *  添加混合中文计算的字符串长度
 *
 *  @param text 待验证的字符串
 *
 *  @return 返回计算的长度
 */
-(NSUInteger) unicodeLengthOfString
{
//    NSUInteger asciiLength = 0;
//    for (NSUInteger i = 0; i < self.length; i++) {
//        unichar uc = [self characterAtIndex: i];
//        asciiLength += isascii(uc) ? 1 : 2;
//    }
//    
//    NSUInteger unicodeLength = asciiLength / 2;
//    
//    if(asciiLength % 2) {
//        unicodeLength++;
//    }
//    
//    return unicodeLength;
    int strlength = 0;
    char* p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding]; i++)
    {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return (strlength+1)/2;
}

+ (NSString *)md5HexDigest:(NSString*)input
{
    const char* cStr = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (uint32_t)strlen(cStr), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (NSInteger i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    return ret;
    
}

/**
 *  验证email
 *
 *  @return 返回是否是email
 */
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}
/**
 *  验证是否是手机号
 *
 *  @return 返回是否是手机号
 */
+ (BOOL) validateMobile:(NSString *)phoneNum
{
    //    NSString *phoneNumRegex = @"^1[3|4|5|8][0-9]\\d{8}";
    //    NSPredicate *phoneNumTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",phoneNumRegex];
    //    return [phoneNumTest evaluateWithObject:phoneNum];
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0-9])\\d{8}$";
    
    NSString * MOBILE1 = @"^1(7[0-9])\\d{8}$";
    
    NSString * MOBILE2 = @"^1(4[0-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    NSPredicate *regextestmobile1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE1];
    
    NSPredicate *regextestmobile2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE2];
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phoneNum] == YES)
        || ([regextestcm evaluateWithObject:phoneNum] == YES)
        || ([regextestct evaluateWithObject:phoneNum] == YES)
        || ([regextestcu evaluateWithObject:phoneNum] == YES)
        || ([regextestmobile1 evaluateWithObject:phoneNum] == YES)
        || ([regextestmobile2 evaluateWithObject:phoneNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }

}

/**
 *  验证是否是QQ
 *
 *  @return 返回是否是QQ号码
 */
+ (BOOL) validateQQ:(NSString *)qqStr
{
    NSString *qqRegex = @"^[0-9]+$";
    
    NSPredicate *qqTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",qqRegex];
    
    return [qqTest evaluateWithObject:qqStr];
}

/**
 *  AES 加密
 *
 *  @param initStr   初始化string
 *  @param encodeStr 解密的string
 *
 *  @return 返回加密后的string
 */
+ (NSString *)encodeAESByKey:(NSString *)initStr secretKeyParam:(NSString *)secretKeyParam
{
    
    const char *cstr = [initStr cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:initStr.length];
    //对数据进行加密
    NSData *result = [data aes256_encrypt:secretKeyParam];
    
    return [GTMBase64 stringByEncodingData:result];
    
//    NSData *initData = [initStr dataUsingEncoding:NSUTF8StringEncoding];
//    
//    CCCryptorStatus error;
//    NSData *encryptData = [initData dataEncryptedUsingAlgorithm:kCCAlgorithmAES128
//                                                            key:secretKey
//                                                        options:(kCCOptionECBMode | kCCOptionPKCS7Padding)
//                                                          error:&error];
//    
//    
//    NSStringEncoding strEncode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//    NSString *result = [[NSString alloc] initWithData:encryptData encoding:strEncode];
//    return result;
}

/**
 *  给加密后的字符串解密
 *
 *  @param decryptedStr 解密
 *
 *  @return 返回解密后的字符串
 */
+ (NSString *)decryptedAES:(NSString *)decryptedStr secretKey:(NSString *)secretKey
{
    CCCryptorStatus error;
    
    NSStringEncoding strEncode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData *data = [decryptedStr dataUsingEncoding:strEncode];
    NSData *decryptData = [data decryptedDataUsingAlgorithm:kCCAlgorithmAES128
                                                        key:secretKey
                                                    options:(kCCOptionECBMode | kCCOptionPKCS7Padding)
                                                      error:&error];
    NSString *initStr = nil;
    if (decryptData != nil) {
        initStr = [[NSString alloc] initWithData:decryptData  encoding:NSUTF8StringEncoding];
    }
    return initStr;
}

/**
 *  过滤指定的Html标签
 *
 *  @param html html内容
 *
 *  @return 返回描述
 */
+ (NSString *)filterSpecifyHtml:(NSString *)html
{
    NSString *htmlStr = [html copy];
    htmlStr = [htmlStr stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    htmlStr = [htmlStr stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    htmlStr = [htmlStr stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    htmlStr = [htmlStr stringByReplacingOccurrencesOfString:@"<br/>" withString:@""];
    htmlStr = [htmlStr stringByReplacingOccurrencesOfString:@"<br>" withString:@""];
    htmlStr = [htmlStr stringByReplacingOccurrencesOfString:@"&nbsp" withString:@" "];
    return htmlStr;
}

/**
 *  判断是否包含html
 *
 *  @param html 标签内容
 *
 *  @return 返回包含的文本
 */
+ (BOOL)isIncludeHtml:(NSString *)html
{
    if([html rangeOfString:@"<"].location == NSNotFound && [html rangeOfString:@"/>"].location == NSNotFound)
    {
        return NO;
    }
    return YES;
}
@end
