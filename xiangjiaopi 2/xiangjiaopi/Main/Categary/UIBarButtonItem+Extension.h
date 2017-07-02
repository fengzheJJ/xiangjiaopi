//
//  UIBarButtonItem+Extension.h
//  PeiWo
//
//  Created by wihan on 15/4/21.
//  Copyright (c) 2015年 wihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem *)itemWithImageName:(NSString *)ImageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;
/**
 *  返回一个仅带文字的UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color target:(id)target action:(SEL)action;

/**
 *  返回一个带有attribute的UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithAttributeTitle:(NSAttributedString *)attributeTitle;

/**
 构建适配iOS7 之后的返回按钮
 
 @param action 回调的方法
 @param responder 响应者
 @return 返回正常的返回按钮
 */
+ (NSArray *)itemAdaptNavBack:(SEL)action responder:(id)responder image:(UIImage *)image;
@end
