//
//  YTNavigationBar.m
//  meituan
//
//  Created by 徐友金 on 2017/7/30.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTNavigationBar.h"

@implementation YTNavigationBar
//自定义导航条
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //让导航条不透明
        [self setShadowImage:[UIImage new]];
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        
        //加背景图片
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_navigationBar_white"]];
        
        [self addSubview:bgImageView];
        
        //设置约束
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.offset(0);
        }];
        
        
        //赋值属性
        _bgImageView = bgImageView;
        
        
        
    }
    return self;
}
@end
