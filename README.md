# GLAssetGridViewController

![Build Status](https://travis-ci.org/msaps/MSSTabbedPageViewController.svg?branch=develop)
![converage](https://img.shields.io/sonar/http/sonar.qatools.ru/ru.yandex.qatools.allure:allure-core/coverage.svg)
![license](https://img.shields.io/github/license/mashape/apistatus.svg)

GLAssetGridViewController 是一个资源视图控制器，例如相片选择器，适配选择器。同时也包含了一个图片浏览器和视频浏览器。

GLAssetGridViewController is an asset view controller, like an picture picker and video picker , also has an photo browser & video browser .

Here is an project where i use it . [Project:666](https://github.com/XuYanci/666)

<div style="width:100%;">
<img src="https://github.com/XuYanci/GLAssetGridViewController/blob/master/readme~resource/present.gif" align="center" height="30%" width="30%" style="margin-left:20px;">
</div>

<p><p>


## Example (例子)
运行工程例子，克隆仓库和构建工程，例子支持Objective-C。

To run the example project, clone the repo and build the project. Examples are available for Objective-C project.

<p><p>


## Installation (安装)

GLAssetGridViewController 适用于图片选择器，视频选择器。

GLAssetGridViewController is use for photo picker , video picker .

GLAssetAssetViewBrowser 适用于图片浏览器，视频浏览器 (进行中)。

GLAssetAssetViewBrowser is use for photo browser, video browser (ing) . 

它们暂时不支持cocopods。你可以克隆仓库，添加 `GLAssetGridViewController.h` `GLAssetGridViewController.m` 到你的工程中用于图片选择器，视频选择器， 添加 `GLAssetViewBrowser.h` `GLAssetViewBrowser.m` 用于图片浏览器。

Now they are not available through cocoapods now. you can clone the repo and add `GLAssetGridViewController.h` `GLAssetGridViewController.m`  to your project for photo picker,add `GLAssetViewBrowser.h` `GLAssetViewBrowser.m` to your project for photo browser. 

<p><p>

## Usage
因为它不是一个公用控件，你可能需要根据你的需求修改代码。

Beacuse it is not an public common control, you need to verify the code as you need. 

使用 GLAssetGridViewController，需要创建一个GLAssetGridViewController的实例，根据你的需要设置PickerType (GLAssetGridType_Picture,GLAssetGridType_Video)。

To Use GLAssetGridViewController, just create an instance of GLAssetGridViewController，and set the pickerType (GLAssetGridType_Picture,GLAssetGridType_Video) as you need. 


使用GLAssetViewBrowser，需要创建一个GLAssetViewBrowser的实例，然后实现以下数据源:
To Use GLAssetViewBrowser, just create and instance of GLAssetViewBrowser,and implement the datasource below: 

```
Here return the numberOfItems in the asset view controller
- (NSUInteger)numberOfItemsInGLAssetViewController:(GLAssetViewBrowser *)assetViewController;
Here return the image for item in the asset view controller
- (UIImage *)imageForItemInGLAssetViewControllerAtIndex:(NSUInteger)itemIndex;
Here asynce return the image for item in the asset view controller
- (void)asyncImageForItemInGLAssetViewControllerAtIndex:(NSUInteger)itemIndex imageAsyncCallback:(GLAssetViewImageAsyncCallback)callback;
``` 
<p><p>


### Page View Controller Enhancements

For the GLAssetGridViewController:
```
When you pick asset callback, you can transfer info as your need. here i use dictionary as param.
- (void)glAssetGridViewController:(id)sender didPickAssets:(NSMutableDictionary *)dictionary;
```

For the GLAssetViewBrowser:
```
When you click on item callback,here return the itemIndex you click.
- (void)glAssetViewController:(id)sender didClickOnItemAtIndex:(NSUInteger)itemIndex;
When browser dismiss, it need to perform dismiss transitions which animate frame to origin rect, here return the image rect for it. 
- (CGRect)imageRectForItemInGLAssetViewControllerAtIndex:(NSUInteger)itemIndex;
```

<p><p>

## Appearance

Wait ...


## Requirements

Supports iOS 9 and above. (Here i use Photos.framework).

<p><p>

## Author
Xu Yanci

Mail: [XuYanci](mailto:grandy.wind@gmail.com)
