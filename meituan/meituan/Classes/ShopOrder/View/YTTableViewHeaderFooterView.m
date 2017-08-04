//
//  YTTableViewHeaderFooterView.m
//  meituan
//
//  Created by 徐友金 on 2017/8/4.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTTableViewHeaderFooterView.h"
#import "YTShopOrderGategoryModel.h"
@implementation YTTableViewHeaderFooterView
//从sb或者xib中进入此方法
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUI];
    
}
//初始化的时候设置9个按钮
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
}

//设置头部视图字体的时候不能再初始化设置,没有尺寸,用延迟或者drowRect方法.
- (void)drawRect:(CGRect)rect
{
    //字体12号
    self.textLabel.font = [UIFont systemFontOfSize:12];
    //字体颜色为黑色
    self.textLabel.textColor = [UIColor blackColor];
    
    //NSLog(@"%@",self);

}


//重写set方法.
- (void)setShopOrderGategoryModel:(YTShopOrderGategoryModel *)shopOrderGategoryModel
{
    _shopOrderGategoryModel = shopOrderGategoryModel;
    self.textLabel.text = shopOrderGategoryModel.name;
}
@end
