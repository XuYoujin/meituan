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

//定义头部视图高度最大值和最小值
#define KShopHeadViewMaxHeight 180
#define KShopHeadViewMinHeight 64


@interface YTShopController ()
//定义头部视图属性,方便后面平移使用
@property (nonatomic,weak)UIView *shopHeadView;
//设置导航栏属性
@property (nonatomic,strong)UIBarButtonItem *shareBtn;

@end

@implementation YTShopController

- (void)viewDidLoad {
    
    [self setupUI];//投机写法

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
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


//添加头部视图
- (void)setupUI
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

- (void)panGesture:(UIPanGestureRecognizer *)pan
{
    NSLog(@"---");
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

    NSLog(@"徐友金");
    
    
    
    
    
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
