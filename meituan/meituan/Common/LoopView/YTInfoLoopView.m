//
//  YTInfoLoopView.m
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTInfoLoopView.h"
#import "YTInfoView.h"

@interface YTInfoLoopView ()
///轮播视图1
@property (nonatomic,weak)YTInfoView *infoView1;
///轮播视图2
@property (nonatomic,weak)YTInfoView *infoView2;

//设置索引
@property (nonatomic,assign)NSInteger index;

@end



@implementation YTInfoLoopView

//从sb或者xib中进入此方法
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUI];
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI
{
    //视图1
    YTInfoView *infoView1 = [[YTInfoView alloc] init];
    
    [self addSubview:infoView1];
    
    //设置约束
    [infoView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.top.bottom.offset(0);
        
    }];
    
    //视图2
    YTInfoView *infoView2 = [[YTInfoView alloc] init];
    
    [self addSubview:infoView2];
    
    //设置约束
    [infoView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(infoView1).offset(0);
        make.width.height.equalTo(infoView1);
        make.top.equalTo(infoView1.mas_bottom).offset(0);
    }];
    
    //赋值
    _infoView1 = infoView1;
    _infoView2 = infoView2;
    
}
//设置数据的时候,会调用次方法
- (void)setDiscounts:(NSArray<YTInfoModel *> *)discounts
{
    
    _discounts = discounts;
    //设置数据
    [self settingData];
    //滚动
    [self scroll];
}


//加载数据 0 ---6 数据
- (void)settingData
{
    if(_index == 6)
    {
        _infoView1.infoModel = _discounts[_index];
        _infoView2.infoModel = _discounts[0];
        
        _index = -1;
    }
    
    else
    {
        _infoView1.infoModel = _discounts[_index];
        
        _infoView2.infoModel = _discounts[_index + 1];

    }
    
}
//滚动
- (void)scroll
{
 
    //延迟2秒执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.5 animations:^{
            
            _infoView1.transform = CGAffineTransformMakeTranslation(0, -self.bounds.size.height);
            _infoView2.transform = CGAffineTransformMakeTranslation(0, -self.bounds.size.height);
            
        } completion:^(BOOL finished) {
            
            //该数据
            _index++;
            [self settingData];
            
            //移动回来
            
            _infoView1.transform = CGAffineTransformIdentity;
            _infoView2.transform = CGAffineTransformIdentity;
            
            
            [self scroll];
            
            
            
        }];
        
        
        
        
        
        
    });
    
    
}

@end
