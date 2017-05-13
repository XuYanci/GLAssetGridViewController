//
//  GLMediaPickerViewController.h
//  66GoodLook
//
//  Created by Yanci on 17/5/3.
//  Copyright © 2017年 Yanci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

////////////////////////// Select Asset  //////////////////////////

@interface SelectAsset:NSObject
@property (nonatomic,strong)PHAsset *asset;
@property (nonatomic,strong)UIImage *image;
@end


typedef enum : NSUInteger {
    GLAssetGridType_Picture,
    GLAssetGridType_Video,
} GLAssetGridType;


@protocol GLAssetGridViewControllerDataSource <NSObject>
@end

@protocol GLAssetGridViewControllerDelegate <NSObject>
- (void)glAssetGridViewController:(id)sender didPickAssets:(NSMutableDictionary *)dictionary;
@end

/*!
 @class GLMediaPickerViewController
 @brief The UIViewController class
 @discussion   媒体库挑选器
 @superclass SuperClass: UIViewController\n
 @classdesign    No special design is applied here.
 @coclass    No coclass
 @helps It helps no other classes.
 @helper    No helper exists for this class.
 */
@interface GLAssetGridViewController : UIViewController
@property (nonatomic,assign) GLAssetGridType pickerType;
@property (nonatomic,weak) id <GLAssetGridViewControllerDataSource>dataSource;
@property (nonatomic,weak) id <GLAssetGridViewControllerDelegate>delegate;

- (id)initWithSelectedAssets:(NSArray *)assets;
- (void)reloadData;
@end
