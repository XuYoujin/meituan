//
//  YTShopPoi_infoModel.h
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YTInfoModel;
@interface YTShopPoi_infoModel : NSObject
//设置背景图片数据属性pic_url
@property (nonatomic,copy)NSString *poi_back_pic_url;

//设置店名图片属性pic_url
@property (nonatomic,copy)NSString *pic_url;

//店名属性
@property (nonatomic,copy)NSString *name;

//商家公告
@property (nonatomic,copy)NSString *bulletin;



//设置信息属性(录播视图的)
@property (nonatomic,strong)NSArray<YTInfoModel *> *discounts;




//字典转模型
+ (instancetype)shopPoi_infoWithDict:(NSDictionary *)dict;



@end
