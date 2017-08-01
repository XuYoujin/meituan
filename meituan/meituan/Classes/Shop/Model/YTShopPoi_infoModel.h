//
//  YTShopPoi_infoModel.h
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTShopPoi_infoModel : NSObject
//设置背景图片数据属性pic_url
@property (nonatomic,copy)NSString *poi_back_pic_url;



//字典转模型
+ (instancetype)shopPoi_infoWithDict:(NSDictionary *)dict;



@end
