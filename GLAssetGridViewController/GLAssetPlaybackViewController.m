//
//  GLAssetPlaybackViewController.m
//  GLAssetGridViewController
//
//  Created by Yanci on 17/5/16.
//  Copyright © 2017年 Yanci. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <Masonry/Masonry.h>
#import "GLAssetPlaybackViewController.h"
#import "GLAssetPlayBackView.h"

@interface GLAssetPlaybackContainer : UIView
@end

@implementation GLAssetPlaybackContainer

@end

@interface GLAssetPlaybackViewController ()

@end

@implementation GLAssetPlaybackViewController {
    BOOL _needsReload;
    BOOL _isFullScreen;
    BOOL _setupConstraints;
    
    struct {
    }_datasourceHas;
    
    struct{
    }_delegateHas;
}
@synthesize mPlayer, mPlayerItem, mPlaybackView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - life cycle
- (void)loadView {
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.container];
    
    [_container addSubview:self.toolbar];
    [self.toolbar addSubview:self.playBtn];
    [self.toolbar addSubview:self.leftTimeLabel];
    [self.toolbar addSubview:self.currentTimeLabel];
    [self.toolbar addSubview:self.timeSlider];
    [self.toolbar addSubview:self.fullScreenBtn];
  
}

- (void)viewWillLayoutSubviews {
    [self _reloadDataIfNeed];
    [self _layoutSubviews];
}




#pragma mark - datasource
#pragma mark - delegate
#pragma mark - user events
- (void)tapInView {
    self.toolbar.hidden = !self.toolbar.hidden;
}

- (void)play {
    NSLog(@"play");
}

- (void)fullScreen {
    NSLog(@"fullscreen");
}

#pragma mark - functions
- (void)commonInit {}

- (void)setDataSource:(id<GLAssetPlaybackViewControllerDataSource>)dataSource {
    
}

- (void)setDelegate:(id<GLAssetPlaybackViewControllerDelegate>)delegate {
    
}

- (void)reloadData {
  
}

- (void)_setNeedsReload {
    _needsReload = YES;
    [self.view setNeedsLayout];
}

- (void)_reloadDataIfNeed {
    if (_needsReload) {
        [self reloadData];
    }
}

- (void)_layoutSubviews {
    if (!_setupConstraints) {
        [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view.mas_left).offset(10);
            make.right.mas_equalTo(self.view.mas_right).offset(-10);
            make.top.mas_equalTo(self.view.mas_top).offset(10);
            make.bottom.mas_equalTo(self.view.mas_bottom).offset(-10);
        }];
        
        [self.toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(_container.mas_bottom).offset(0);
            make.left.mas_equalTo(_container.mas_left).offset(0);
            make.right.mas_equalTo(_container.mas_right).offset(0);
            make.height.offset(44.0);
        }];
        
        [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_toolbar.mas_left).offset(10);
            make.width.offset(30);
            make.height.offset(30);
            make.centerY.mas_equalTo(_toolbar.mas_centerY).offset(0);
        }];

        [self.currentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.playBtn.mas_right).offset(10);
            make.centerY.mas_equalTo(_toolbar.mas_centerY).offset(0);
        }];

        [self.fullScreenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_toolbar.mas_right).offset(-10);
            make.width.offset(30);
            make.height.offset(30);
            make.centerY.mas_equalTo(_toolbar.mas_centerY).offset(0);
        }];
        
        [self.leftTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.fullScreenBtn.mas_left).offset(-10);
            make.centerY.mas_equalTo(_toolbar.mas_centerY).offset(0);
        }];

        [self.timeSlider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.currentTimeLabel.mas_right).offset(10);
            make.centerY.mas_equalTo(_toolbar.mas_centerY).offset(0);
            make.right.mas_equalTo(self.leftTimeLabel.mas_left).offset(-10);
            make.height.offset(30);
        }];
        
        _setupConstraints = YES;
    }
}

- (void)setURL:(NSURL *)URL {
    if (mURL != URL) {
        mURL = [URL copy];
    }
}

- (void)setPlayerItem:(AVPlayerItem *)playerItem {
    mPlayerItem = playerItem;
    
    /** Resize video frame */
    CGSize videoSize = [self getPlayerItemVideoSize];
    [self.container mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.offset(videoSize.width);
        make.height.offset(videoSize.height);
    }];
    [self.view updateConstraints];
    [self.view setNeedsLayout];
    
    /** TODO play video */
}

- (AVPlayerItem *)getPlayerItem {
    return mPlayerItem;
}



- (CGSize)getPlayerItemVideoSize {
    AVAssetTrack *track = [[mPlayerItem.asset tracksWithMediaType:AVMediaTypeVideo]objectAtIndex:0];
    CGSize size = CGSizeApplyAffineTransform(track.naturalSize, track.preferredTransform);
    CGSize videoSize = CGSizeMake(fabs(size.width), fabs(size.height));
    CGSize actualSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,
                                   [UIScreen mainScreen].bounds.size.width  / (videoSize.width / videoSize.height ) );

    return actualSize;
}

#pragma mark - notification
#pragma mark - getter and setter
- (UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = [[UIButton alloc]init];
        [_playBtn setImage:[UIImage imageNamed:@"play_icon"]
                  forState:UIControlStateNormal];
        [_playBtn setImage:[UIImage imageNamed:@"pause_icon"]
                  forState:UIControlStateSelected];
        [_playBtn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}

- (UIButton *)fullScreenBtn {
    if (!_fullScreenBtn) {
        _fullScreenBtn = [[UIButton alloc]init];
        [_fullScreenBtn setImage:[UIImage imageNamed:@"movieFullscreen"]
                        forState:UIControlStateNormal];
        [_fullScreenBtn setImage:[UIImage imageNamed:@"ft_video_icon_full"]
                        forState:UIControlStateSelected];
        [_fullScreenBtn addTarget:self action:@selector(fullScreen) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fullScreenBtn;
}

- (UISlider *)timeSlider {
    if (!_timeSlider) {
        _timeSlider = [[UISlider alloc]init];
        [_timeSlider setThumbImage:[UIImage imageNamed:@"xx_video_btn"] forState:UIControlStateNormal];
//        [_timeSlider setMinimumValueImage:[UIImage imageNamed:@"xx_video_bg"]];
//        [_timeSlider setMaximumValueImage:[UIImage imageNamed:@"xx_video_jd"]];
    }
    return _timeSlider;
}

- (UILabel *)currentTimeLabel {
    if (!_currentTimeLabel) {
        _currentTimeLabel = [[UILabel alloc]init];
        _currentTimeLabel.textColor = [UIColor whiteColor];
        _currentTimeLabel.text = @"00:00";
        _currentTimeLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return _currentTimeLabel;
}

- (UILabel *)leftTimeLabel {
    if (!_leftTimeLabel) {
        _leftTimeLabel = [[UILabel alloc]init];
        _leftTimeLabel.textColor = [UIColor whiteColor];
        _leftTimeLabel.text = @"00:00";
        _leftTimeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _leftTimeLabel;
}

- (UIView *)container {
    if (!_container) {
        _container = [[UIView alloc]init];
        _container.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapInView)];
        [_container addGestureRecognizer:tapGestureRecognizer];
    }
    return _container;
}

- (GLAssetPlaybackContainer*)toolbar {
    if (!_toolbar) {
        _toolbar = [[GLAssetPlaybackContainer alloc]init];
        _toolbar.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    }
    return _toolbar;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


@implementation GLAssetPlaybackViewController (Player)
@end
