//
//  YTShopController.m
//  meituan
//
//  Created by 徐友金 on 2017/7/30.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopController.h"
#import "YTFoodDetailController.h"
#import "YTNavigationBar.h"
#import "Additons.h"

#import "YTShopOrderController.h"
#import "YTShopCommentController.h"
#import "YTShopInfoController.h"



//定义头部视图高度最大值和最小值
#define KShopHeadViewMaxHeight 180
#define KShopHeadViewMinHeight 64


@interface YTShopController ()
//定义头部视图属性,方便后面平移使用
@property (nonatomic,weak)UIView *shopHeadView;
//设置导航栏属性
@property (nonatomic,strong)UIBarButtonItem *shareBtn;
//设置标签视图属性
@property (nonatomic,strong)UIView *shopTagView;


@end

@implementation YTShopController

- (void)viewDidLoad {
    
    [self setupUI];//投机写法

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    //设置导航条
    [self settingNavigationBar];
}


#pragma mark - 设置导航条
- (void)settingNavigationBar
{
    
    self.navitem.title = @"百年烤鸭店";
    
    //设置导航条的字的颜色,刚加载为0
    self.naviBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithWhite:0.4 alpha:0]};
    
    
    
    self.naviBar.bgImageView.alpha = 0;
    
    
    //添加右边的分析
    UIBarButtonItem *shareButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_share"] style:UIBarButtonItemStylePlain target:self action:@selector(share)];
    
    self.navitem.rightBarButtonItem = shareButtonItem;
    
    self.naviBar.tintColor = [UIColor whiteColor];//刚开始为白色
    
    //赋值
    _shareBtn = shareButtonItem;

}






//点击分享跳转事件
- (void)share
{
    NSLog(@"点击分享了");
}

//测试点击跳转下面界面
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    
//    YTFoodDetailController *foodDetailController = [[YTFoodDetailController alloc] init];
//    [self.navigationController pushViewController:foodDetailController animated:YES];
//}


#pragma mark - 设置主界面
- (void)setupUI
{
    //设置头部视图
    [self settingHeaderView];
    
    //设置标签栏
    [self settingShopTagView];
    
    //设置滚动视图
    [self settingShopScrollView];
    
}
#pragma mark - 设置滚动视图
- (void)settingShopScrollView
{
    //创建scrollView
    UIScrollView *shopScrollView = [[UIScrollView alloc] init];
    
    shopScrollView.backgroundColor = [UIColor brownColor];
    
    //设置scrollView相关属性 滚动条取消  弹簧取消, 分页打开
    
    shopScrollView.showsVerticalScrollIndicator = NO;
    shopScrollView.showsHorizontalScrollIndicator = NO;
    
    shopScrollView.bounces = NO;
    
    shopScrollView.pagingEnabled = YES;
    
    
    
    
    //添加到父控件中
    [self.view addSubview:shopScrollView];
    
    //设置约束
    [shopScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_shopTagView.mas_bottom).offset(0);
        make.left.right.bottom.offset(0);
    }];
    
    //创建三个View并且添加到scrollview中
    YTShopOrderController *orderVC = [[YTShopOrderController alloc] init];
    YTShopCommentController *commentVC = [[YTShopCommentController alloc] init];
    YTShopInfoController *InfoVC = [[YTShopInfoController alloc] init];
    
    
    NSArray *arrVCs = @[orderVC,commentVC,InfoVC];
    
    for (UIViewController *vc in arrVCs) {
        //添加View
        [shopScrollView addSubview:vc.view];
        //建立父子控制器关系
        [self addChildViewController:vc];
        
        [vc didMoveToParentViewController:self];
        
        
    }
    //设置约束跳转
    [shopScrollView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.offset(0);
        
        //为了设置contentsize,设置宽高
//        make.height.mas_offset(shopScrollView.mas_height);
//        make.width.mas_offset(shopScrollView.mas_width);
        
        //make.height.mas_equalTo(shopScrollView);
        
        make.width.height.equalTo(shopScrollView);
        
    }];
    
    [shopScrollView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    
    
    
    
}


#pragma mark - 设置标签栏
- (void)settingShopTagView
{
    UIView *shopTagView = [[UIView alloc] init];
    shopTagView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:shopTagView];
    
    //设置约束
    [shopTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.offset(0);
        make.top.equalTo(_shopHeadView.mas_bottom).offset(0);
        make.height.offset(44);
    }];
    //赋值
    //_shopHeadView = shopTagView;  你厉害,搞个大乌龙
    
    _shopTagView = shopTagView;

    
   UIButton *orderBtn = [self makeShopTagViewButtonWithTitle:@"点菜"];
    
    [self makeShopTagViewButtonWithTitle:@"评价"];
    
    [self makeShopTagViewButtonWithTitle:@"商家"];
    
    
    //设置约束
    [shopTagView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.bottom.offset(0);
        
    }];
    
    [shopTagView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    //添加小黄条
    UIView *shopTagLineView = [[UIView alloc] init];
    
    shopTagLineView.backgroundColor = [UIColor primaryYellowColor];
    
    //加入父控件
    [shopTagView addSubview:shopTagLineView];
    //设置约束 50 4
    [shopTagLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(4);
        make.width.offset(50);
        
        make.bottom.offset(0);
        
        make.centerX.equalTo(orderBtn).offset(0);
        
    }];
    
    
    
    
    
    
    
    
    
    
    
}

- (UIButton *)makeShopTagViewButtonWithTitle:(NSString *)title
{
    UIButton *btn = [[UIButton alloc] init];
    
    //设置按钮标签
    [btn setTitle:title forState:UIControlStateNormal];
    
    //设置按钮字体颜色
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    //设置按钮的字体
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    
    //添加到父控件中
    [_shopTagView addSubview:btn];
    
    
    return btn;
    
    
    
}




#pragma mark - 设置头部视图
- (void)settingHeaderView
{
    UIView *shopHeadView = [[UIView alloc] init];
    shopHeadView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:shopHeadView];
    
    //设置约束
    [shopHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.offset(0);
        make.height.offset(180);
        
    }];
    
    
    //添加平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    
    //加在头部视图身上(错误)
    
    //添加在View 身上
    [self.view addGestureRecognizer:pan];
    
    
    //赋值
    _shopHeadView = shopHeadView;
    

}


#pragma mark - 给View添加平移手势.
- (void)panGesture:(UIPanGestureRecognizer *)pan
{
    //NSLog(@"---");
    //CGPoint p = [pan locationInView:pan.view];//为啥还能调用???
    CGPoint p = [pan translationInView:pan.view];
    
    
    CGFloat newHeight = _shopHeadView.bounds.size.height;//本身有累加
    
    //通过约束来设置高(随时变化)
    [_shopHeadView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        if(newHeight + p.y < KShopHeadViewMinHeight)
        {
            make.height.offset(64);
        }
        else if(newHeight + p.y >= KShopHeadViewMaxHeight)
        {
            make.height.offset(KShopHeadViewMaxHeight);
        }
        else
        {
            make.height.offset(newHeight + p.y);
        }
        
        
    }];
    
    //回复P的值
    [pan setTranslation:CGPointZero inView:pan.view];
    
    /**
     导航条:   y = a * x + b;
     
    0  180
    1  64
     
     0  180 * x +b
     1  64 * x + b
     
     1 = (64 -180) * x
     
     a =  1/ (64- 180) = - 1/ 116
     
     b = - 180 / (64 - 180) =  180/116
    
    
    */
    //CGFloat alpha = -1 / 116.0 * newHeight + 180 / 116.0;
    
    //CGFloat alpha = [self resultWithConsult:newHeight andConsult1:180 andResult1:0 andConsult2:64 andResult2:1];
    
    //CGFloat alpha = [@(newHeight) resultWithConsult1:180 andResult1:0 andConsult2:64 andResult2:1];
    
    CGFloat alpha = [@(newHeight)resultWithValue1:YTValueMake(180, 0) andValue2:YTValueMake(64, 1)];
    
    self.naviBar.bgImageView.alpha = alpha;
    
    
    self.naviBar.titleTextAttributes =  @{NSForegroundColorAttributeName:[UIColor colorWithWhite:0.4 alpha:alpha]};
    
    CGFloat white =  [@(newHeight)resultWithValue1:YTValueMake(180, 1) andValue2:YTValueMake(64, 0.4)];

    //让分享按钮渐变
    self.naviBar.tintColor = [UIColor colorWithWhite:white alpha:1];
    
    
    //处了180是白色,其他都是黑色
    if(newHeight == KShopHeadViewMaxHeight && self.statusBarStyle != UIStatusBarStyleLightContent)
    {
        self.statusBarStyle = UIStatusBarStyleLightContent;
    }
    else if (newHeight == KShopHeadViewMinHeight && self.statusBarStyle != UIStatusBarStyleDefault)
    {
        self.statusBarStyle = UIStatusBarStyleDefault;

    }

    
    
    
    
    
}

//- (CGFloat)resultWithConsult:(CGFloat)consult andConsult1:(CGFloat)consult1 andResult1:(CGFloat)result1 andConsult2:(CGFloat)consult2 andResult2:(CGFloat)result2
//{
//    
//    CGFloat a = (result1 - result2) / (consult1 - consult2);
//    
//    CGFloat b = result1 - a * consult1;
//    
//    return a * consult + b;
//    
//
//}



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
