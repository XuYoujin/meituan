//
//  YTFoodDetailCell.m
//  meituan
//
//  Created by 徐友金 on 2017/8/4.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTFoodDetailCell.h"
#import "YTShopOrderFoodModel.h"

#import "Additons.h"
@interface YTFoodDetailCell ()<UIScrollViewDelegate>
//图片
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
//店名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//月售
@property (weak, nonatomic) IBOutlet UILabel *month_saled_contentLabel;
//价格
@property (weak, nonatomic) IBOutlet UILabel *min_priceLabel;

//描述信息
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
//百分比
@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;
//进度
@property (weak, nonatomic) IBOutlet UIProgressView *prpgress;

//scrollView属性
@property (weak, nonatomic) IBOutlet UIScrollView *foodDetailScrollView;
//处理没有商品信息的情况,隐藏商品信息标签,设置评价新的约束
///商品信息标签
@property (weak, nonatomic) IBOutlet UILabel *foodInfoLabel;
///商品评价约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *foodConmmentTopConstraint;

@end



@implementation YTFoodDetailCell

//设置值
- (void)setShopOrderFoodModel:(YTShopOrderFoodModel *)shopOrderFoodModel
{
    
    _shopOrderFoodModel = shopOrderFoodModel;
    
    [_pictureImageView sd_setImageWithURL:[NSURL URLWithString:[shopOrderFoodModel.picture stringByDeletingPathExtension]]];
    
    _nameLabel.text = shopOrderFoodModel.name;
    
    _month_saled_contentLabel.text = shopOrderFoodModel.month_saled_content;
    
    _min_priceLabel.text = [NSString stringWithFormat:@"¥%.1f",shopOrderFoodModel.min_price];
    
    _descLabel.text = shopOrderFoodModel.desc;
    
    //处理值为NAN问题.
    CGFloat percent = 0.0;
    
    if(shopOrderFoodModel.praise_num_new != 0)//加入赞不为0计算好评度,不然直接为0.
    {
        percent = shopOrderFoodModel.praise_num_new /  (shopOrderFoodModel.praise_num_new + shopOrderFoodModel.tread_num);
        
    }
    
    
    
    _percentageLabel.text = [NSString stringWithFormat:@"%.f%%",percent * 100];
    
    _prpgress.progress = percent;
    
    //处理没有商品信息的情况,隐藏商品信息标签,设置评价新的约束
    _foodInfoLabel.hidden = (_descLabel.text.length) ? NO : YES;
    
    _foodConmmentTopConstraint.constant = (_descLabel.text.length) ? 8 : -23;

    
    
    
    
}


//滚动时候实现突破放大
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"cell滚动了");
    //滚动距离(向下的为负值)
    
    
    CGFloat offsetY = _foodDetailScrollView.contentOffset.y;
    if(offsetY < 0)//往下拉的时候放大,bounds时候就是这样.向下为小
    {
        CGFloat scale = [@(offsetY)resultWithValue1:YTValueMake(0, 1) andValue2:YTValueMake(-240, 2)];
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        
        //先移动,后慢慢变大(移动距离注意下,中间向两边放大,为一半)
        transform = CGAffineTransformTranslate(transform, 0, offsetY * 0.5);
        
        transform = CGAffineTransformScale(transform, scale, scale);
        
        _pictureImageView.transform = transform;
        
        //_pictureImageView.transform = CGAffineTransformMakeScale(scale, scale);
    }
    else//这个还是有点不理解,过猛的话,Y大于0 进不去索引变大点.最后把它恢复.
    {
        _pictureImageView.transform = CGAffineTransformIdentity;
    }
    
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setupUI];
    
}

- (void)setupUI
{
    //设置代理scrollView代理
    _foodDetailScrollView.delegate = self;
    
}
@end
