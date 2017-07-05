//
//  CMPlayerManager.h
//  TestAudioPlayer
//
//  Created by 邓汉森 on 2017/7/4.
//  Copyright © 2017年 denghansen@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>

// 播放器的几种状态
typedef NS_ENUM(NSInteger, PlayerState) {
    kPlayerStateFailed,        // 播放失败
    kPlayerStateBuffering,     // 缓冲中
    kPlayerStatePlaying,       // 播放中
    kPlayerStateReadyToPlaying, //准备完毕即将播放
    kPlayerStateStopped,        //停止播放
    kPlayerStateFinished,        //完成播放
    kPlayerStatePause,       // 暂停播放
};

@interface CMPlayerManager : NSObject

@property (nonatomic,assign)PlayerState state;

+ (instancetype)shareInstance;

- (void)playerViewPlayWithUrl:(NSURL * )url;
/**
 *  播放
 */
- (void)play;
/**
 * 暂停
 */
- (void)pause;
@end
