//
//  YTShopOrderController.h
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YTShopOrderGategoryModel;
@interface YTShopOrderController : UIViewController

///设置存储点菜组模型的数组属性
@property (nonatomic,strong)NSArray<YTShopOrderGategoryModel *> *foodDate;

@end
