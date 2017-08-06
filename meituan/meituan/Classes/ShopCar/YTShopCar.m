//
//  YTShopCar.m
//  meituan
//
//  Created by 徐友金 on 2017/8/6.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopCar.h"
#import "YTShopCarModel.h"
#import "Additons.h"
@interface YTShopCar ()<CAAnimationDelegate>
///购物车按钮
@property (weak, nonatomic) IBOutlet UIButton *shopCarBtn;

///总值标签
@property (weak, nonatomic) IBOutlet UILabel *sum_valueLabel;
///请添加按钮
@property (weak, nonatomic) IBOutlet UIButton *please_addBtn;

//设置小圆点属性
@property (weak, nonatomic) IBOutlet UILabel *redBallLabel;


//移动的小红点属性
@property (nonatomic,weak)UIImageView *animImageView;

@end

@implementation YTShopCar

+ (instancetype)shopCar
{
   return [[[UINib nibWithNibName:@"ShopCar" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
    
    
}


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

- (void)setupUI
{
    //设置小圆点
    UILabel *redBallLabel = [UILabel makeLabelWithText:@"988" andTextFont:12 andTextColor:[UIColor whiteColor]];
    
    redBallLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_food_count_bg"]];
    
    //添加父控件,并设置约束
    [_shopCarBtn addSubview:redBallLabel];
    [redBallLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.offset(0);
        make.height.width.offset(16);
        
    }];
    
    redBallLabel.hidden = YES;
    
    //设置文字水平居中
    redBallLabel.textAlignment = NSTextAlignmentCenter;
    
    //垂直居中
    redBallLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    
    //设置自动大小
    redBallLabel.adjustsFontSizeToFitWidth = YES;
    
    _redBallLabel = redBallLabel;
    
    
    [_please_addBtn addTarget:self action:@selector(_please_addBtnClick) forControlEvents:UIControlEventTouchUpInside];
}


//点击结账按钮操作步骤
- (void)_please_addBtnClick
{
    NSLog(@"要付:%@",_sum_valueLabel.text);
}



///通模型的set方法来赋值
- (void)setShopCarModel:(YTShopCarModel *)shopCarModel
{
    _shopCarModel = shopCarModel;
    
    
    ///
    ///NSNumber *sum_price = [shopCarModel.foodModelArray valueForKeyPath:@"@sum.min_price"];
    
    //用于数组
    NSNumber *sun_price = [shopCarModel.shopfoodModelArr valueForKeyPath:@"@sum.min_price"];
    
    
    _sum_valueLabel.text = [@"¥ " stringByAppendingFormat:@"%@",sun_price];
    
    
    //根据数组里面是否有东西来设置按钮颜色
    UIImage *image = [UIImage imageNamed:shopCarModel.shopfoodModelArr.count ? @"button_shoppingCart_noEmpty" : @"button_shoppingCart_empty"];
    
    [_shopCarBtn setImage:image forState:UIControlStateNormal];
    
    //设置添加按钮的背景色
    [_please_addBtn setBackgroundColor:shopCarModel.shopfoodModelArr.count ? [UIColor primaryYellowColor] : [UIColor lightGrayColor]];
    //设置添加按钮的文字
    [_please_addBtn setTitle:shopCarModel.shopfoodModelArr.count ? @"结  账" : @"请添加" forState:UIControlStateNormal];
    
    //小红点是否显示
    _redBallLabel.hidden = (shopCarModel.shopfoodModelArr.count == 0);
    
    //小红点的值
    _redBallLabel.text = @(shopCarModel.shopfoodModelArr.count).description;
    
    
}

///动漫方法
- (void)animWithStarPoint:(CGPoint)starPoit
{
    //设置运动图片
    UIImageView *animImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_common_point"]];
    
    //添加父控件,并设置约束(似乎没有设置约束)
    [self addSubview:animImageView];
    
    
    
    
    
    //创建什么动漫
    CAKeyframeAnimation *keyframeAnim = [CAKeyframeAnimation animation];
    
    //如何创建
    keyframeAnim.keyPath = @"position";
    

    UIBezierPath *path = [[UIBezierPath alloc] init];
    

    //注意已转换好开始点:
    [path moveToPoint:starPoit];
    
    CGPoint controlPoint = CGPointMake(starPoit.x - 100 , starPoit.y - 150);
    //设置动漫时间
    keyframeAnim.duration = 0.5;
    //设置动漫次数
    keyframeAnim.repeatCount = 1;
    
    //动漫停在购物车按钮中心不懂
    keyframeAnim.fillMode = kCAFillModeForwards;
    keyframeAnim.removedOnCompletion = NO;
    
    
    [path addQuadCurveToPoint:_shopCarBtn.center controlPoint:controlPoint];
    
    
    keyframeAnim.path = path.CGPath;
    //设置代理
    keyframeAnim.delegate = self;
    
    //在动漫存图片
    [keyframeAnim setValue:animImageView forKey:@"animImageView"];
    
    
    //添加在谁身上
    [animImageView.layer addAnimation:keyframeAnim forKey:nil];
    
    //赋值
    //_animImageView = animImageView;

    
    
}

//动漫结束后代理方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    ////删除动漫小红点
    ////[_animImageView removeFromSuperview];
    //取动漫中的图片
    UIImageView *animImageView = [anim valueForKeyPath:@"animImageView"];
    
    //移除动漫
    [animImageView removeFromSuperview];
    
    
    
    //删除后动漫小红点,按钮放大缩小
    
    [UIView animateWithDuration:0.25 animations:^{
        
        _shopCarBtn.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            
            _shopCarBtn.transform = CGAffineTransformIdentity;
            
        }];
    }];
    
    
    
    
}

@end
