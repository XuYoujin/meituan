//
//  YTShopDetailController.m
//  meituan
//
//  Created by 徐友金 on 2017/8/3.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopDetailController.h"

#import "YTShopPoi_infoModel.h"
#import "Additons.h"
#import "YTInfoView.h"


#define KMargin 16

//重写scrollview
@interface YTScrollView : UIScrollView

@end

@implementation YTScrollView

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"%s",__func__);
    //点击scrollview 退出商家详情
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
    
}

@end


@interface YTShopDetailController ()

@end

@implementation YTShopDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    [self setupUI];
    
    
    
}

//创建界面
- (void)setupUI
{
    
    //TODO创建背景图片
    UIImageView *bgImageView = [[UIImageView alloc] init];
    
    [bgImageView sd_setImageWithURL:[NSURL URLWithString:[_shopPoi_infoModel.poi_back_pic_url stringByDeletingPathExtension]]];
    
    [self.view addSubview:bgImageView];
    
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.offset(0);
    }];
    
    
    //TODO 添加关闭按钮
    UIButton *closeBtn = [[UIButton alloc] init];
    
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_selected"] forState:UIControlStateHighlighted];
    
    
    [self.view addSubview:closeBtn];
    
    //设置约束
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-60);
        
    }];
    
    //设置点击按钮事件
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    //TODO 设置滚动视图(内部直接设置contextView,方便约束)
    YTScrollView *scrollView = [[YTScrollView alloc] init];
    
    //scrollView.backgroundColor = [UIColor orangeColor];
    
    
    //取消滚动条
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    

    
    
    //添加到父控件
    [self.view addSubview:scrollView];
    
    //设置约束
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        
        make.bottom.equalTo(closeBtn.mas_top).offset(-60);
        
        
    }];
    
    //TODO 创建contextview
    UIView *contextView = [[UIView alloc] init];
    
    //测试背景颜色
    //contextView.backgroundColor = [UIColor darkGrayColor];
    
    [scrollView addSubview:contextView];
    
    //设置约束
    [contextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        
        make.width.equalTo(scrollView);
        
        //make.height.offset(1000);//预估
        
        
    }];
    
    
    //TODO 商家名字
    UILabel *nameLabel = [UILabel makeLabelWithText:_shopPoi_infoModel.name andTextFont:14 andTextColor:[UIColor whiteColor]];
    
    [contextView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.centerX.offset(0);//44+20
    }];
    
    //起送价及配送
    UILabel *shopTipLabel = [UILabel makeLabelWithText:[NSString stringWithFormat:@"%@ | %@ | %@分钟",_shopPoi_infoModel.min_price_tip,_shopPoi_infoModel.shipping_fee_tip,_shopPoi_infoModel.avg_delivery_time] andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    
    
    [contextView addSubview:shopTipLabel];
    
    [shopTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(nameLabel.mas_bottom).offset(KMargin * 0.5);
    }];
    
    //TODO折扣信息
    UILabel *discoutLabel = [UILabel makeLabelWithText:@"折扣信息" andTextFont:16 andTextColor:[UIColor whiteColor]];
    
    [contextView addSubview:discoutLabel];
    
    [discoutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(shopTipLabel.mas_bottom).offset(KMargin *2.5);
    }];
    
    //TODO折扣信息左边的线
    UIView *leftLineView = [[UIView alloc] init];
    leftLineView.backgroundColor = [UIColor whiteColor];
    
    [contextView addSubview:leftLineView];
    [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(KMargin);
        make.right.equalTo(discoutLabel.mas_left).offset(-KMargin);
        make.height.offset(1);
        make.centerY.equalTo(discoutLabel);
        
    }];
    
    
    //TODO折扣信息右边的线
    UIView *rightLineView = [[UIView alloc] init];
    rightLineView.backgroundColor = [UIColor whiteColor];
    
    [contextView addSubview:rightLineView];
    [rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-KMargin);
        make.left.equalTo(discoutLabel.mas_right).offset(KMargin);
        make.height.offset(1);
        make.centerY.equalTo(discoutLabel);
        
    }];
    
    
    //优惠信息
    UIStackView *stackView = [[UIStackView alloc] init];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    
    stackView.distribution = UIStackViewDistributionFillEqually;
    
    stackView.spacing = 10;
    
    for (YTInfoModel *infoModel in _shopPoi_infoModel.discounts) {
        
        YTInfoView *infoView = [[YTInfoView alloc] init];
        infoView.infoModel = infoModel;
        
        [stackView addArrangedSubview:infoView];
        
    }
    
    [contextView addSubview:stackView];
    
    //设置约束
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(discoutLabel.mas_bottom).offset(KMargin);
        make.left.offset(KMargin);
        make.right.offset(-KMargin);
        
        make.height.offset(_shopPoi_infoModel.discounts.count * 30);
        
        
    }];
    
    //TODO公告信息
    UILabel *bolletinLabel = [UILabel makeLabelWithText:@"公告信息" andTextFont:16 andTextColor:[UIColor whiteColor]];
    
    [contextView addSubview:bolletinLabel];
    
    [bolletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(stackView.mas_bottom).offset(KMargin *2.5);
    }];
    
    //TODO公告信息左边的线
    UIView *bolletinleftLineView = [[UIView alloc] init];
    bolletinleftLineView.backgroundColor = [UIColor whiteColor];
    
    [contextView addSubview:bolletinleftLineView];
    [bolletinleftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(KMargin);
        make.right.equalTo(bolletinLabel.mas_left).offset(-KMargin);
        make.height.offset(1);
        make.centerY.equalTo(bolletinLabel);
        
    }];
    
    
    //TODO公告信息右边的线
    UIView *bolletinrightLineView = [[UIView alloc] init];
    bolletinrightLineView.backgroundColor = [UIColor whiteColor];
    
    [contextView addSubview:bolletinrightLineView];
    [bolletinrightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-KMargin);
        make.left.equalTo(bolletinLabel.mas_right).offset(KMargin);
        make.height.offset(1);
        make.centerY.equalTo(bolletinLabel);
        
    }];
    
    
    //TODO 公告消息
    UILabel *bolletinInfoLabel = [UILabel makeLabelWithText:_shopPoi_infoModel.bulletin andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    
    //设置自动换行
    bolletinInfoLabel.numberOfLines = 0;
    
    [contextView addSubview:bolletinInfoLabel];
    
    [bolletinInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bolletinLabel.mas_bottom).offset(KMargin);
        make.left.offset(KMargin);
        make.right.offset(-KMargin);
        
        //设置底部约束,可以算出context
        make.bottom.offset(-KMargin);
    }];
    
    
    
    
    
    
    
    
}

//关闭按钮点击相应事件
- (void)closeBtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


//点击商家详情界面,结束后调用
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //关闭界面
    [self dismissViewControllerAnimated:YES completion:nil];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
