//
//  GLAssetPlayBackView.m
//  GLAssetGridViewController
//
//  Created by Yanci on 17/5/14.
//  Copyright © 2017年 Yanci. All rights reserved.
//

#import "GLAssetPlayBackView.h"

@implementation GLAssetPlayBackView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)player {
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}

- (void)setVideoFillMode:(NSString *)fillMode {
    AVPlayerLayer *playerLayer = (AVPlayerLayer *)[self layer];
    playerLayer.videoGravity = fillMode;
}

@end
