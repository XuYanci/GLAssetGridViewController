//
//  GLAssetPlayBackView.h
//  GLAssetGridViewController
//
//  Created by Yanci on 17/5/14.
//  Copyright © 2017年 Yanci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GLAssetPlayBackView : UIView
@property (nonatomic,strong)AVPlayer *player;
- (void)setPlayer:(AVPlayer *)player;
- (void)setVideoFillMode:(NSString *)fillMode;
@end
