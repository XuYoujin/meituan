//
//  YTCountView.h
//  meituan
//
//  Created by 徐友金 on 2017/8/4.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YTShopOrderFoodModel,YTCountView;

typedef enum : NSUInteger {
    YTCountViewBtnTypeAddBtn,
    YTCountViewBtnTypeMinusBtn,
} YTCountViewBtnType;



@protocol  YTCountViewDelegate<NSObject>

@optional


- (void)countViewValueChage:(YTCountView *)countView;

@end



@interface YTCountView : UIView

@property (nonatomic,strong)YTShopOrderFoodModel *foodModel;

//设置点击按钮的类型
@property (nonatomic,assign)YTCountViewBtnType type;
///添加按钮属性
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

//设置代理
@property (nonatomic,weak)id<YTCountViewDelegate> delegate;

//提供一个类方法实例化自己
+ (instancetype)coutView;

@end
