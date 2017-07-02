//
//  NSString+Additional.m
//  Utils
//
//  Created by 韩威 on 16/4/20.
//  Copyright © 2016年 韩威. All rights reserved.
//

#import "NSString+Additional.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Additional)

- (BOOL)isNotEmpty {
    return ((![self isEqualToString:@""])&&(self!= nil) && [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length > 0&&(NSNull *)self!=[NSNull null]);
}

/**
 *  是否包含Emoji
 */
- (BOOL)isContainsEmojiString {
    if (![self isNotEmpty]) {
        return NO;
    }
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:self options:NSMatchingWithTransparentBounds range:NSMakeRange(0, [self length])];
    if (numberOfMatches > 0) {
        return YES;
    }
    return NO;
}

/**
 *  检测格式合法性
 */
//检测是否是邮箱
- (BOOL)isValidEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self predicateValidWithRegex:emailRegex];
}

//检测是否是手机号
- (BOOL)isValidMobilePhoneNum {
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    return [self predicateValidWithRegex:phoneRegex];
}

//检测是否合法座机
- (BOOL)isValidPhoneNum {
    NSString *phoneRegex = @"^(^0\\d{2}-?\\d{8}$)|(^0\\d{3}-?\\d{7}$)|(^\\(0\\d{2}\\)-?\\d{8}$)|(^\\(0\\d{3}\\)-?\\d{7}$)$";
    return [self predicateValidWithRegex:phoneRegex];
    
}

//检测是否合法邮政编码
- (BOOL)isValidMailCode {
    NSString *mailCodeRegex = @"^\\d{6}$";
    return [self predicateValidWithRegex:mailCodeRegex];
}

//检测是否是身份证号
- (BOOL)isValidPersonCardNum {
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    return [self predicateValidWithRegex:regex2];
}

//检测是否是车牌号
- (BOOL)isValidCarNum {
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    return [self predicateValidWithRegex:carRegex];
}

//判断是否为整形
- (BOOL)isPureInt {
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形
- (BOOL)isPureFloat {
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

/**
 *  MD5
 */
- (NSString *)md5Str {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

#pragma mark - private
- (BOOL)predicateValidWithRegex:(NSString *)regex {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}


/**
 *  计算文字大小
 */
- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
    CGSize titleSize;
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_7_0
    titleSize = [self sizeWithFont:font constrainedToSize:size];
#endif
    NSDictionary *attributes = @{NSFontAttributeName:font};
    titleSize = [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return titleSize;
}


/**
 *  时间戳转日期
 *
 *  @return yyyy年MM月dd日
 */
- (NSString *)timestampToTimeStr
{
    NSTimeInterval timestamp = [self doubleValue];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}


/**
 *  格式化字符串
 *  "1000.00" and "1008977.72" to "1,000.00" and "1,008,977.00"
 *
 *  @see http://stackoverflow.com/questions/10103270/how-to-use-thousand-separator-in-nsstring
 */
- (NSString *)formatStringToThousandthPriceString {
    
    if ([self isPureFloat]) {
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setGroupingSeparator:@","];
        [numberFormatter setGroupingSize:3];
        [numberFormatter setUsesGroupingSeparator:YES];
        [numberFormatter setDecimalSeparator:@"."];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [numberFormatter setMaximumFractionDigits:2];
        float floatPrice = [self floatValue];
        NSString *resultString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatPrice]];
        return resultString;
    } else {
        return nil;
    }
}


/// &nbsp; -> " "
- (NSString *)replaceNBSPToSpace {
    return [self stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
}


- (id)JsonStringToObject
{
    if (![self isNotEmpty]) return nil;
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:jsonData
                                                           options:NSJSONReadingMutableContainers
                                                             error:&error];
    if (error)
    {
        MyLog(@"字符串转字典失败：%@",self);
        return nil;
    }
    else
    {
        return result;
    }
}

@end





