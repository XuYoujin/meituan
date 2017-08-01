//
//  YTInfoLoopView.h
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YTInfoModel;
@interface YTInfoLoopView : UIView

//设置所有打折信息属性(轮播视图的)
@property (nonatomic,strong)NSArray<YTInfoModel *> *discounts;

@end
