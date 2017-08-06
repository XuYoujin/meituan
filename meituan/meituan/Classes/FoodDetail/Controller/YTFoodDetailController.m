//
//  YTFoodDetailController.m
//  meituan
//
//  Created by 徐友金 on 2017/7/30.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTFoodDetailController.h"
#import "YTNavigationBar.h"

#import "YTFoodDetailFlowLayout.h"
#import "YTShopOrderFoodModel.h"
#import "YTShopOrderGategoryModel.h"
#import "YTFoodDetailCell.h"

#import "YTShopCar.h"//引入购物车
@interface YTFoodDetailController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
static NSString *foodDetailCellID = @"foodDetailCellID";
@implementation YTFoodDetailController

- (void)viewDidLoad {
    
    //设置界面
    [self setupUI];

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor = [UIColor redColor];
    
    //设置导航条背景色透明
    self.naviBar.bgImageView.alpha = 0;
    //设置渲染色为白色
    self.naviBar.tintColor = [UIColor whiteColor];
    
    //让系统不要内缩
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    YTShopCar *shopCar = [YTShopCar shopCar];//创建购物
    //添加父控件并设置约束
    [self.view addSubview:shopCar];
    
    [shopCar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(shopCar.bounds.size.height);
    }];

    shopCar.shopCarModel = _shopCarModel;
   
    
}

//- (void)setShopCarModel:(YTShopCarModel *)shopCarModel
//{
//    _shopCarModel = shopCarModel;
//    
//    
//}





- (void)setupUI
{
    
    YTFoodDetailFlowLayout *foodDetailFlowLayout = [[YTFoodDetailFlowLayout alloc] init];
    
    UICollectionView *foodDetailCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:foodDetailFlowLayout];
    
    
    //加入父控件并设置约束
    [self.view addSubview:foodDetailCollectionView];
    
    
    //设置背景色
    foodDetailCollectionView.backgroundColor = [UIColor whiteColor];
    
    [foodDetailCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    
    foodDetailCollectionView.showsVerticalScrollIndicator = NO;
    foodDetailCollectionView.showsHorizontalScrollIndicator = NO;
    
    foodDetailCollectionView.bounces = NO;
    foodDetailCollectionView.pagingEnabled = YES;
    
    
    //设置代理和数据源
    foodDetailCollectionView.delegate = self;
    foodDetailCollectionView.dataSource = self;
    
    //注册cell
    [foodDetailCollectionView registerNib:[UINib nibWithNibName:@"YTFoodDetailCell" bundle:nil] forCellWithReuseIdentifier:foodDetailCellID];
    
    
    
    //开始时候滚动到对于表格,布局比较靠后(用延迟函数,或者在layoutSubView时候,但是会多次调用,设置只调用一次)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [foodDetailCollectionView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    });
    
    
    
    
}

///数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _foodDate.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _foodDate[section].spus.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YTFoodDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:foodDetailCellID forIndexPath:indexPath];
    
    //赋值
    cell.shopOrderFoodModel = _foodDate[indexPath.section].spus[indexPath.row];
    
    return cell;
}
@end
