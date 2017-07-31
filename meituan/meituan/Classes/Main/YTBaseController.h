//
//  YTBaseController.h
//  meituan
//
//  Created by 徐友金 on 2017/7/30.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YTNavigationBar;
@interface YTBaseController : UIViewController
//基类设置导航条属性抛出
@property (nonatomic,strong,readonly)YTNavigationBar *naviBar;
//基类设置导航item属性抛出
@property (nonatomic,strong,readonly)UINavigationItem *navitem;
//设置状态栏样式
@property (nonatomic,assign)UIStatusBarStyle statusBarStyle;


@end
