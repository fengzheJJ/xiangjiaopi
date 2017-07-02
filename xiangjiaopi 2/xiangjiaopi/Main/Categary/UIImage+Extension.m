//
//  UIImage+Extension.m
//  PeiWo
//
//  Created by wihan on 15/4/21.
//  Copyright (c) 2015年 wihan. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)imageWithName:(NSString *)name {
    UIImage *image = nil;
    if (kIOS7) { // 处理iOS7的情况
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}

+ (UIImage *)getOriImage:(NSString *)name {
    UIImage *oriImage = [UIImage imageNamed:name];
    if (oriImage) {
        oriImage = [oriImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    return oriImage;
}


/**
 *  通过给定的颜色值及size得到对应的图片
 *
 *  @param color 颜色值
 *  @param size  图片的尺寸大小
 *
 *  @return 返回值
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    return [self resizedImageWithName:name left:0.5 top:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}
@end
