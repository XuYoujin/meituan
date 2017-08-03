//
//  YTShopOrderGategoryModel.m
//  meituan
//
//  Created by 徐友金 on 2017/8/3.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopOrderGategoryModel.h"

#import "YTShopOrderFoodModel.h"

@implementation YTShopOrderGategoryModel
+ (instancetype)shopOrderGategoryModelWithDict:(NSDictionary *)dict {
    // 创建模型对象
    id obj = [[self alloc] init];
    // 用KVC给对象中的属性赋值
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
    
}

//这个方法特别注意super,不然没有数据
- (void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    
    if([key isEqualToString:@"spus"])
    {
        //不要忘记这边的转换哦.不然又要弄挺久时间.
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dic in value) {
            
            YTShopOrderFoodModel *foodModel = [YTShopOrderFoodModel shopOrderFoodModelWithDict:dic];
            
            [arrM addObject:foodModel];
        }
        
        
        _spus = arrM;//拦截数据
        //NSLog(@"%@",_spus);
    }
    
    
}




- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
