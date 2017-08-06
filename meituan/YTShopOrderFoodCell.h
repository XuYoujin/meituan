//
//  YTShopOrderFoodCell.h
//  meituan
//
//  Created by 徐友金 on 2017/8/4.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YTShopOrderFoodModel,YTCountView;
@interface YTShopOrderFoodCell : UITableViewCell
//设置食物模型
@property (nonatomic,strong)YTShopOrderFoodModel *shopOrderFoodModel;


//设置计数View的属性
@property (nonatomic,weak)YTCountView *countView;

@end
