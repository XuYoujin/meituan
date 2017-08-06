//
//  YTShopCarModel.m
//  meituan
//
//  Created by 徐友金 on 2017/8/6.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopCarModel.h"

@implementation YTShopCarModel


//实例化数组
- (NSMutableArray<YTShopOrderFoodModel *> *)shopfoodModelArr
{
    if(_shopfoodModelArr == nil)
    {
        _shopfoodModelArr = [NSMutableArray array];
    }
    return _shopfoodModelArr;
}


@end
