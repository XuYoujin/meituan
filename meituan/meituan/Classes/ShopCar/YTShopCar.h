//
//  YTShopCar.h
//  meituan
//
//  Created by 徐友金 on 2017/8/6.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YTShopCarModel;
@interface YTShopCar : UIView

//设置个存储加进来foodModel的购物车模型
@property (nonatomic,strong)YTShopCarModel *shopCarModel;

///动漫方法(抛出)
- (void)animWithStarPoint:(CGPoint)starPoit;
//弄个类方法自己加载
+ (instancetype)shopCar;

@end
