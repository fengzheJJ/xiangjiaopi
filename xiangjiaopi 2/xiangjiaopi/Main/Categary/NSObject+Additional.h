//
//  NSObject+Additional.h
//  Utils
//
//  Created by 韩威 on 16/4/21.
//  Copyright © 2016年 韩威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Additional)

#pragma mark - MBProgress HUD
///===================================================================
/// @name MBProgress HUD
///===================================================================


+ (void)showToastWithString:(NSString *)str;
+ (void)showToastWithString:(NSString *)str inView:(UIView *)view;

+ (void)showLoadingWithString:(NSString *)str;
+ (void)showLoadingWithString:(NSString *)str inView:(UIView *)view;
+ (void)hiddenLoading;
+ (void)hiddenLoadingInView:(UIView *)view;

@end
