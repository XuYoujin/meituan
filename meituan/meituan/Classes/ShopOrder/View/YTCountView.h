//
//  YTCountView.h
//  meituan
//
//  Created by 徐友金 on 2017/8/4.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YTShopOrderFoodModel;
@interface YTCountView : UIView

@property (nonatomic,strong)YTShopOrderFoodModel *foodModel;

//提供一个类方法实例化自己
+ (instancetype)coutView;

@end
