//
//  YTInfoModel.m
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTInfoModel.h"

@implementation YTInfoModel

+ (instancetype)InfoModelWithDict:(NSDictionary *)dict {
    // 创建模型对象
    id obj = [[self alloc] init];
    // 用KVC给对象中的属性赋值
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
