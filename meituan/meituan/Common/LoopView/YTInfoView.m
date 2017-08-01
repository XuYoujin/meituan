//
//  YTInfoView.m
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTInfoView.h"
#import "YTInfoModel.h"

#import "Additons.h"
@interface YTInfoView ()
//图片控件属性
@property (nonatomic,weak)UIImageView *iconView;

//信息标签
@property (nonatomic,weak)UILabel *infoLable;

@end


@implementation YTInfoView


//从sb或者xib中进入此方法
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUI];
    
}
//初始化的时候设置9个按钮
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

//设置轮播视图的内容
- (void)setupUI
{
    
    //设置图片
    //UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"button_shoppingCart_noEmpty"]];
    
    UIImageView *iconView = [[UIImageView alloc] init];
    
    //iconView.backgroundColor = [UIColor yellowColor];
    
    [self addSubview:iconView];
    //设置约束
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.equalTo(iconView.mas_height);
        
    }];
    
    //优化信息
    UILabel *infoLable = [[UILabel alloc] init];
    
    //12号字体,白色
    infoLable.font = [UIFont systemFontOfSize:12];
    
    infoLable.textColor = [UIColor whiteColor];
    
    infoLable.text = @"免费吃,免费吃,吃完送钱,快点来呀!!!";
    //加入父控件中
    [self addSubview:infoLable];
    
    //设置约束
    [infoLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(8);
        make.centerY.equalTo(iconView).offset(0);
    }];
    
    
    //赋值
    _iconView = iconView;
    _infoLable = infoLable;
    
    
    
}





//通过set方法为loopView赋值

- (void)setInfoModel:(YTInfoModel *)infoModel
{
    _infoModel = infoModel;
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:infoModel.icon_url]];
    
    _infoLable.text = infoModel.info;
    
    
}



@end
