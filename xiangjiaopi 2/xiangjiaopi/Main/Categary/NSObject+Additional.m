//
//  NSObject+Additional.m
//  Utils
//
//  Created by 韩威 on 16/4/21.
//  Copyright © 2016年 韩威. All rights reserved.
//

#import "NSObject+Additional.h"
#import "MBProgressHUD.h"

@implementation NSObject (Additional)

#pragma mark - MBProgress HUD
///===================================================================
/// @name MBProgress HUD
///===================================================================

#define kTopWindow [[UIApplication sharedApplication].windows lastObject]
#define kHUDLoadingTag 7001


+ (void)showToastWithString:(NSString *)str {
    [self showToastWithString:str inView:kTopWindow];
}

+ (void)showToastWithString:(NSString *)str inView:(UIView *)view {
    if (str && [str length] > 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.margin = 10.f;
        hud.yOffset = 100.f;
        hud.detailsLabelFont = [UIFont boldSystemFontOfSize:14.f];
        hud.removeFromSuperViewOnHide = YES;
        hud.detailsLabelText = str;
        NSTimeInterval timeInterval = [str length] > 10 ? 2.f : 1.f;
        [hud hide:YES afterDelay:timeInterval];
    }
}

+ (void)showLoadingWithString:(NSString *)str {
    [self showLoadingWithString:str inView:kTopWindow];
}

+ (void)showLoadingWithString:(NSString *)str inView:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.tag = kHUDLoadingTag;
    //hud.margin = 10.f;
    hud.labelText = str;
    hud.labelFont = [UIFont boldSystemFontOfSize:14.f];
}

+ (void)hiddenLoading {
    [self hiddenLoadingInView:kTopWindow];
}

+ (void)hiddenLoadingInView:(UIView *)view {
    NSArray *allHuds = [MBProgressHUD allHUDsForView:view];
    [allHuds enumerateObjectsUsingBlock:^(MBProgressHUD  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag == kHUDLoadingTag) {
            [obj removeFromSuperview];
        }
    }];
}


@end
