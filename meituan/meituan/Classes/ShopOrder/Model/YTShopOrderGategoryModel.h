//
//  YTShopOrderGategoryModel.h
//  meituan
//
//  Created by 徐友金 on 2017/8/3.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YTShopOrderFoodModel;

//食物组模型
@interface YTShopOrderGategoryModel : NSObject
///设置分组名字属性(右边组的cell内容)
@property (nonatomic,copy)NSString *name;

///每组的内容(spus)
@property (nonatomic,strong)NSArray<YTShopOrderFoodModel *> *spus;

+ (instancetype)shopOrderGategoryModelWithDict:(NSDictionary *)dict;

@end
