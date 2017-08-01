//
//  YTShopView.h
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YTShopPoi_infoModel;
@interface YTShopView : UIView

//设置模型,用来接收数据
@property (nonatomic,strong)YTShopPoi_infoModel *shopPoi_infoModel;
@end
