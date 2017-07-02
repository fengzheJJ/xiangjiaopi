//
//  UIBarButtonItem+Extension.m
//  PeiWo
//
//  Created by wihan on 15/4/21.
//  Copyright (c) 2015年 wihan. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"
#import "NSString+Size.h"

@implementation UIBarButtonItem (Extension)

+(UIBarButtonItem *)itemWithImageName:(NSString *)ImageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action
{
    //自定义UIView
    UIButton *btn = [[UIButton alloc]init];

    //设置按钮的背景图片（默认/高亮）
    [btn setBackgroundImage:[UIImage imageWithName:ImageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithName:highImageName] forState:UIControlStateHighlighted];

    //设置按钮的尺寸和图片一样大，使用了UIImage的分类
    btn.size = btn.currentBackgroundImage.size;

    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

/**
 *  返回一个仅带文字的UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:color forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font;
    CGSize buttonSize = [title sizeWithFont:font];
    button.frame = CGRectMake(0, 0, button.currentImage.size.width + buttonSize.width, button.currentImage.size.height);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)itemWithAttributeTitle:(NSAttributedString *)attributeTitle
{
    UILabel *label = [[UILabel alloc]init];
    label.attributedText = attributeTitle;

    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
//    CGSize labelSize = [attributeTitle boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    CGSize labelSize = [attributeTitle boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    
    label.frame = CGRectMake(0, 0, labelSize.width, labelSize.height);
    
    return [[UIBarButtonItem alloc] initWithCustomView:label];
}


/**
 构建适配iOS7 之后的返回按钮

 @param action 回调的方法
 @param responder 响应者
 @return 返回正常的返回按钮
 */
+ (NSArray *)itemAdaptNavBack:(SEL)action responder:(id)responder image:(UIImage *)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //设置按钮的背景图片（默认/高亮）
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    //设置按钮的尺寸和图片一样大，使用了UIImage的分类
    btn.size = btn.currentBackgroundImage.size;
    [btn addTarget:responder
            action:action
  forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                    target:nil
                                                                                    action:nil];
    
    /**
     width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和  边界间距为5pix，所以width设为-5时，间距正好调整为0；width为正数 时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = -15;
    return [NSArray arrayWithObjects:negativeSpacer, btn_right, nil];
}

@end
