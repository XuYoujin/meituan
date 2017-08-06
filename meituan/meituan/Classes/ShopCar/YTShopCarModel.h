//
//  YTShopCarModel.h
//  meituan
//
//  Created by 徐友金 on 2017/8/6.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YTShopOrderFoodModel;
@interface YTShopCarModel : NSObject
@property (nonatomic,strong)NSMutableArray<YTShopOrderFoodModel *> *shopfoodModelArr;
@end
