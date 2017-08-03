//
//  YTShopOrderFoodModel.h
//  meituan
//
//  Created by 徐友金 on 2017/8/3.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

//食物模型
@interface YTShopOrderFoodModel : NSObject

///菜名
@property (nonatomic,copy)NSString *name;


+ (instancetype)shopOrderFoodModelWithDict:(NSDictionary *)dict;
@end
