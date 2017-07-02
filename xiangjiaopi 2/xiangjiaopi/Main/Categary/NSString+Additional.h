//
//  NSString+Additional.h
//  Utils
//
//  Created by 韩威 on 16/4/20.
//  Copyright © 2016年 韩威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (Additional)


/**
 *  检测字符串是否为空
 */
- (BOOL)isNotEmpty;

/**
 *  是否包含Emoji
 */
- (BOOL)isContainsEmojiString;


/**
 *  检测格式合法性
 */
//检测是否是邮箱
- (BOOL)isValidEmail;

//检测是否是手机号
- (BOOL)isValidMobilePhoneNum;

//检测是否合法座机
- (BOOL)isValidPhoneNum;

//检测是否合法邮政编码
- (BOOL)isValidMailCode;

//检测是否是身份证号
- (BOOL)isValidPersonCardNum;

//检测是否是车牌号
- (BOOL)isValidCarNum;

//判断是否为整形
- (BOOL)isPureInt;

//判断是否为浮点形
- (BOOL)isPureFloat;

/**
 *  MD5
 */
- (NSString *)md5Str;

/**
 *  计算文字大小
 */
- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

/**
 *  时间戳转日期
 *
 *  @return yyyy年MM月dd日
 */
- (NSString *)timestampToTimeStr;

/**
 *  格式化字符串
 *  "1000.00" and "1008977.72" to "1,000.00" and "1,008,977.00"
 *
 *  @see http://stackoverflow.com/questions/10103270/how-to-use-thousand-separator-in-nsstring
 */
- (NSString *)formatStringToThousandthPriceString;

/// &nbsp; -> " "
- (NSString *)replaceNBSPToSpace;


- (id)JsonStringToObject;

@end

