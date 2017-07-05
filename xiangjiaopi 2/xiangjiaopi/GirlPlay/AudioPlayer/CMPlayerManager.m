//
//  CMPlayerManager.m
//  TestAudioPlayer
//
//  Created by 邓汉森 on 2017/7/4.
//  Copyright © 2017年 denghansen@126.com. All rights reserved.
//

#import "CMPlayerManager.h"
#import <AVFoundation/AVFoundation.h>

static void *PlayViewStatusObservationContext = &PlayViewStatusObservationContext;

@interface CMPlayerManager ()

@property (nonatomic,strong)AVPlayer * player;
/**
 *  当前播放的item
 */
@property (nonatomic, strong) AVPlayerItem   *currentItem;
@end
@implementation CMPlayerManager

#pragma mark - life circle
+ (instancetype)shareInstance
{
    static CMPlayerManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    return _manager;
}

#pragma mark - player action
- (void)moviePlayDidEnd:(NSNotification *)notify{
    
    [self pause];
}

#pragma mark - deal playitem
/**
 *  重写playerItem的setter方法，处理自己的逻辑
 */
-(void)setCurrentItem:(AVPlayerItem *)playerItem{
    if (_currentItem == playerItem) {
        return;
    }
    if (_currentItem) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:_currentItem];
        [_currentItem removeObserver:self forKeyPath:@"status"];
        [_currentItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
//        [_currentItem removeObserver:self forKeyPath:@"playbackBufferEmpty"];
//        [_currentItem removeObserver:self forKeyPath:@"playbackLikelyToKeepUp"];
        [_currentItem removeObserver:self forKeyPath:@"duration"];
        
        _currentItem = nil;
    }
    _currentItem = playerItem;
    if (_currentItem) {
        [_currentItem addObserver:self
                       forKeyPath:@"status"
                          options:NSKeyValueObservingOptionNew
                          context:PlayViewStatusObservationContext];
        
        [_currentItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:PlayViewStatusObservationContext];
//        // 缓冲区空了，需要等待数据
//        [_currentItem addObserver:self forKeyPath:@"playbackBufferEmpty" options: NSKeyValueObservingOptionNew context:PlayViewStatusObservationContext];
//        // 缓冲区有足够数据可以播放了
//        [_currentItem addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options: NSKeyValueObservingOptionNew context:PlayViewStatusObservationContext];
        
        [_currentItem addObserver:self forKeyPath:@"duration" options:NSKeyValueObservingOptionNew context:PlayViewStatusObservationContext];
        
        [self.player replaceCurrentItemWithPlayerItem:_currentItem];
        // 添加视频播放结束通知
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:_currentItem];
    }
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if (context == PlayViewStatusObservationContext)
    {
        if ([keyPath isEqualToString:@"status"]) {
            AVPlayerStatus status = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
            switch (status)
            {
                    /* Indicates that the status of the player is not yet known because
                     it has not tried to load new media resources for playback */
                case AVPlayerStatusUnknown:
                {
                    self.state = kPlayerStateBuffering;

                }
                    break;
                    
                case AVPlayerStatusReadyToPlay:
                {
                    self.state = kPlayerStateReadyToPlaying;
                }
                    break;
                    
                case AVPlayerStatusFailed:
                {
                    
                    self.state = kPlayerStateFailed;

                }
                    break;
            }
            
        }else if ([keyPath isEqualToString:@"duration"]) {
      
        }
        else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
            
//            // 计算缓冲进度
//            NSTimeInterval timeInterval = [self availableDuration];
//            CMTime duration             = self.currentItem.duration;
//            CGFloat totalDuration       = CMTimeGetSeconds(duration);
//            //缓冲颜色
//            self.playBottomView.cacheProgressValue = timeInterval / totalDuration;
        }
        else if ([keyPath isEqualToString:@"playbackBufferEmpty"]) {
            //            [self.loadingView startAnimating];
//            // 当缓冲是空的时候
//            if (self.currentItem.playbackBufferEmpty) {
//                self.state = kPlayerStateBuffering;
//                [self loadedTimeRanges];
//            }
        } else if ([keyPath isEqualToString:@"playbackLikelyToKeepUp"]) {
            //here
            //            [self.loadingView stopAnimating];
            // 当缓冲好的时候
//            if (self.currentItem.playbackLikelyToKeepUp && self.state == kPlayerStateBuffering){
//                self.state = kPlayerStatePlaying;
//            }
        }
    }
}


#pragma mark - public function
- (void)playerViewPlayWithUrl:(NSURL * )url{
    
    self.currentItem = [AVPlayerItem playerItemWithURL:url];
    [self.player play];
}
/**
 *  播放
 */
- (void)play{
    
    [self.player play];
}
/**
 * 暂停
 */
- (void)pause{
    if (self.state==kPlayerStatePlaying || self.state == kPlayerStateReadyToPlaying) {
        self.state = kPlayerStateStopped;
    }
    [self.player pause];
}

#pragma mark - setter and getter
- (AVPlayer *)player{

    if (!_player) {
        _player = [AVPlayer playerWithPlayerItem:self.currentItem];
    }
    return _player;
}
@end
