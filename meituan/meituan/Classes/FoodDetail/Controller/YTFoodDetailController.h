//
//  YTFoodDetailController.h
//  meituan
//
//  Created by 徐友金 on 2017/7/30.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTBaseController.h"
@class YTShopOrderGategoryModel,YTShopCarModel;
@interface YTFoodDetailController : YTBaseController
///设置存储点菜组模型的数组属性
@property (nonatomic,strong)NSArray<YTShopOrderGategoryModel *> *foodDate;

///食物表格给食物细节传递的索引信息
@property (nonatomic,strong)NSIndexPath *indexPath;

///购物车模型
@property (nonatomic,strong)YTShopCarModel *shopCarModel;

@end
