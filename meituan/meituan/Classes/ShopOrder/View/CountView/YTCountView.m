//
//  YTCountView.m
//  meituan
//
//  Created by 徐友金 on 2017/8/4.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTCountView.h"
#import "YTShopOrderFoodModel.h"
@interface YTCountView ()
//减去按钮
@property (weak, nonatomic) IBOutlet UIButton *decreaseButton;
//最终值标签
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;



@end



@implementation YTCountView




- (void)setFoodModel:(YTShopOrderFoodModel *)foodModel
{
    _foodModel = foodModel;
    
    //_count = foodModel.count;
    
    [self updateDate];
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
    [self updateDate];
}




//点击减少按钮
- (IBAction)decreaseBtnClinck:(id)sender {
    
    _foodModel.count--;
    
    [self updateDate];
    
    //设置按钮类型
    _type = YTCountViewBtnTypeMinusBtn;
    
    if([self.delegate respondsToSelector:@selector(countViewValueChage:)])
    {
        [self.delegate countViewValueChage:self];
    }
    
}
//点击增加按钮
- (IBAction)addBtnClick:(id)sender {
    _foodModel.count++;
    [self updateDate];
    
    //设置按钮类型
    _type = YTCountViewBtnTypeAddBtn;
    
    if([self.delegate respondsToSelector:@selector(countViewValueChage:)])
    {
        [self.delegate countViewValueChage:self];
    }

}

//更新数据
- (void)updateDate
{
    if(_foodModel.count == 0)
    {
        _resultLabel.hidden = YES;
        _decreaseButton.hidden = YES;
    }
    else
    {
        _resultLabel.hidden = NO;
        _decreaseButton.hidden = NO;

    }
    
    //计算结果
    
    _resultLabel.text = @(_foodModel.count).description;
    
}




+(instancetype)coutView
{
    return [[[UINib nibWithNibName:@"countView" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
}
@end
