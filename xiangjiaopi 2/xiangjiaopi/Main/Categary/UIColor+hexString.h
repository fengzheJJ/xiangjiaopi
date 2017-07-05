//
//  UIColor+hexString.h
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/4.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (hexString)

/**
 string 转化成颜色 fb86a7

 */
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;
@end
