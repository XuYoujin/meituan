//
//  YTInfoModel.h
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTInfoModel : NSObject
//设置图片信息
@property (nonatomic,copy)NSString *icon_url;
//设置内容
@property (nonatomic,copy)NSString *info;

+ (instancetype)InfoModelWithDict:(NSDictionary *)dict;
@end
