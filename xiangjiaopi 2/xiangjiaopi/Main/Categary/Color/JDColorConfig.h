//
//  JDColorConfig.h
//  PersonToPerson
//
//  Created by abel on 15/7/17.
//  Copyright © 2015年 abel. All rights reserved.
//

#import <Foundation/Foundation.h>

// 主色调
typedef NS_ENUM(NSUInteger, JDMainColor) {
    JDMainBackgroundColor = 0xf3f5f6,   /**< 0xebebed 主背景色  */
};

// 文字颜色
typedef NS_ENUM(NSUInteger,JDTextColor) {
    JDTextMainTitleColor = 0X262a2e, /* 消息页面title按键颜色 */
    JDTextSecondTitleColor = 0xe4e4e4, /* 二级按键颜色 */
};

// 辅助色 auxiliary
typedef NS_ENUM(NSUInteger,JDAuxiliaryColor) {
    JDAuxiliaryInsideSeparationColor = 0xe6e8eb, /**< 0xdee0e3 模块内部分割线 */
};

// 色彩体系  system
typedef NS_ENUM(NSUInteger,XJSystemColor) {
    JDSystemFirstColor = 0xffe400,
};


@interface JDColorConfig : NSObject

@end
