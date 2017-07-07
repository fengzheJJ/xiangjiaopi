//
//  UIColor+Utils.m
//  PersonToPerson
//
//  Created by abel on 15/4/20.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import "UIColor+Utils.h"

@implementation UIColor (Utils)

// 从WEB Color获取RGB颜色值
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    if (hexString == nil) {
        return nil;
    }
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

+ (UIColor *)colorFromConfigColor:(NSInteger)color {
    return [UIColor colorWithRed:((color & 0xFF0000) >> 16)/255.0 green:((color & 0xFF00) >> 8)/255.0 blue:(color & 0xFF)/255.0 alpha:1.0];
}

//JDMainBackgroundColor 封装的背景色，用来挑选颜色

@end
