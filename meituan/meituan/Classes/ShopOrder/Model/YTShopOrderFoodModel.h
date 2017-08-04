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

///图片
@property (nonatomic,copy)NSString *picture;
///菜名
@property (nonatomic,copy)NSString *name;
///描述信息
@property (nonatomic,copy)NSString *desc;
///月售
@property (nonatomic,copy)NSString *month_saled_content;
///点赞
@property (nonatomic,copy)NSString *praise_content;
///价格(少人民币符号)
@property (nonatomic,assign)float min_price;

///计算器属性(只要模型在,就在)
@property (nonatomic,assign)float count;


+ (instancetype)shopOrderFoodModelWithDict:(NSDictionary *)dict;
@end
