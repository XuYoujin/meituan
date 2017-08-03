//
//  YTShopOrderGategoryCell.m
//  meituan
//
//  Created by 徐友金 on 2017/8/3.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopOrderGategoryCell.h"
#import "Additons.h"
@implementation YTShopOrderGategoryCell

//从sb或者xib中进入此方法
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUI];
    
}
//初始化的时候设置9个按钮
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    
    
    
    self.textLabel.numberOfLines = 2;
    self.textLabel.font = [UIFont systemFontOfSize:12];
    //将背景颜色在后面设置,让标签没有颜色.
    self.backgroundColor = [UIColor colorWithHex:0xefefef];

    
    //设置背景视图
    UIView *bgLineView = [[UIView alloc] init];
    
    bgLineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage dashLineViewWithColor:[UIColor blackColor]]];

    self.backgroundView = bgLineView;
    //设置约束
    [bgLineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.bottom.left.offset(0);
        make.height.offset(1);
        
    }];
    
    
    //设置选中的背景图片
    UIView *selectBGView = [[UIView alloc] init];
    
    selectBGView.backgroundColor = [UIColor whiteColor];
    
    self.selectedBackgroundView = selectBGView;
    
    //UIView *lineView = [uiL]
    
    
    
    
}
@end
