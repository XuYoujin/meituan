//
//  YTShopOrderFoodCell.m
//  meituan
//
//  Created by 徐友金 on 2017/8/4.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopOrderFoodCell.h"
#import "YTShopOrderFoodModel.h"
#import "Additons.h"

#import "YTCountView.h"

@interface YTShopOrderFoodCell ()
///图片控件属性
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
///店名
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
///描述
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
///月售
@property (weak, nonatomic) IBOutlet UILabel *month_saled_contect;
///点赞
@property (weak, nonatomic) IBOutlet UILabel *praise_numLabel;
///价格
@property (weak, nonatomic) IBOutlet UILabel *min_priceLabel;


//设置描述到顶部的约束.假如没有,设置为0
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *descTopConstraint;



@end

@implementation YTShopOrderFoodCell


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
    YTCountView *countView = [YTCountView coutView];
    //cell放在contentview中
    
    [self.contentView addSubview:countView];
    //设置约束
    [countView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.offset(-8);
        make.size.mas_offset(countView.bounds.size);
    }];
    
    //赋值
    _countView = countView;
}

///重写模型的set方法进行赋值
- (void)setShopOrderFoodModel:(YTShopOrderFoodModel *)shopOrderFoodModel
{
    _shopOrderFoodModel = shopOrderFoodModel;
    
    //加载图片多了一个后缀要去掉.[imageview sd_setImageWithURL
    [_pictureImageView sd_setImageWithURL:[NSURL URLWithString:[shopOrderFoodModel.picture stringByDeletingPathExtension]]];
    
    _nameLable.text = shopOrderFoodModel.name;
    
    _descLabel.text = shopOrderFoodModel.desc;
    
    _month_saled_contect.text = shopOrderFoodModel.month_saled_content;
    
    _praise_numLabel.text = shopOrderFoodModel.praise_content;
    
    
     //给计数器控件赋值
    _countView.foodModel = shopOrderFoodModel;
    
    
    
    //注意下:
    //_min_priceLabel.text = @(shopOrderFoodModel.min_price).description;
    _min_priceLabel.text = [NSString stringWithFormat:@"￥ %.1f",shopOrderFoodModel.min_price];
    
    //根据是否有描述信息进行设置约束
    
    //严谨点把空格去除(不要忘记原理是.count.)
 // shopOrderFoodModel.desc = [shopOrderFoodModel.desc stringByReplacingOccurrencesOfString:@" " withString:@""];
    _descTopConstraint.constant = ([shopOrderFoodModel.desc stringByReplacingOccurrencesOfString:@" " withString:@""].length) == 0 ? 0 : 8;
    
    

}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
