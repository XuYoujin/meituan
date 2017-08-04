//
//  YTShopOrderFoodModel.m
//  meituan
//
//  Created by 徐友金 on 2017/8/3.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopOrderFoodModel.h"

@implementation YTShopOrderFoodModel
+ (instancetype)shopOrderFoodModelWithDict:(NSDictionary *)dict {
    // 创建模型对象
    id obj = [[self alloc] init];
    // 用KVC给对象中的属性赋值
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
    
}

//有个值不一样所以拦截下
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"description"])
    {
        _desc = value;
    }
}

@end
