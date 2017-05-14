//
//  ViewController.m
//  GLAssetGridViewController
//
//  Created by Yanci on 17/5/13.
//  Copyright © 2017年 Yanci. All rights reserved.
//

#import "ViewController.h"
#import "GLAssetGridViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)promptPic:(id)sender {
    GLAssetGridViewController *assetGridVC = [[GLAssetGridViewController alloc]init];
    assetGridVC.pickerType = GLAssetGridType_Picture;
    [self presentViewController:
     [[UINavigationController alloc]initWithRootViewController:assetGridVC] animated:YES completion:nil];

}

- (IBAction)promptVid:(id)sender {
    GLAssetGridViewController *assetGridVC = [[GLAssetGridViewController alloc]init];
    assetGridVC.pickerType = GLAssetGridType_Video;
    [self presentViewController:
     [[UINavigationController alloc]initWithRootViewController:assetGridVC] animated:YES completion:nil];

}


@end
