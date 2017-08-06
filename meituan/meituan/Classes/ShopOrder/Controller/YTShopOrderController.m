//
//  YTShopOrderController.m
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopOrderController.h"

#import "YTShopOrderFoodModel.h"
#import "YTShopOrderGategoryModel.h"

#import "YTShopOrderGategoryCell.h"
#import "YTTableViewHeaderFooterView.h"
#import "YTShopOrderFoodCell.h"

#import "YTFoodDetailController.h"

#import "YTShopCar.h"
#import "YTShopCarModel.h"
@interface YTShopOrderController ()<UITableViewDelegate,UITableViewDataSource>

//设置组视图属性
@property (nonatomic,weak)UITableView *categoryTableView;
//设置食物视图属性
@property (nonatomic,weak)UITableView *foodTableView;

//设置选中的@property
@property (nonatomic,assign)BOOL tableGategoryTableViewClick;

//设置购物车属性
@property (nonatomic,weak)YTShopCar *shopCar;

//设置个存储加进来foodModel的购物车模型(代理是控制器,后面取赋值)
@property (nonatomic,strong)YTShopCarModel *shopCarModel;



@end

static NSString *categoryTableViewID = @"categoryTableViewID";
static NSString *foodTableViewID = @"foodTableViewID";
static NSString *foodTableHeaderViewID = @"foodTableHeaderViewID";


@implementation YTShopOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self setup];
    
    
    //将购物车界面置顶
    [self.view bringSubviewToFront:_shopCar];
    
}
//设置主界面
- (void)setup
{
    //设置购物车
    [self settingShopCarView];
    
    //设置食物类表格
    [self settingCategoryTableView];
    //设置食物表格
    [self settingFoodTableView];
    
    
    _tableViews = @[_categoryTableView,_foodTableView];
}


///添加购物传界面
- (void)settingShopCarView
{
    YTShopCar *shopCar = [YTShopCar shopCar];
    
    //加入父控件,并设置约束
    [self.view addSubview:shopCar];
    
    [shopCar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(shopCar.bounds.size.height);
    }];
    
    _shopCar = shopCar;
}




//设置左边categorytableView
- (void)settingCategoryTableView
{
    
    UITableView *categoryTableView = [[UITableView alloc] init];
    [self.view addSubview:categoryTableView];
    
    //设置约束
    [categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(0);
        make.width.offset(100);
        
        make.bottom.equalTo(_shopCar.mas_top).offset(0);
        
    }];
    
    //隐藏分割线
    categoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置组行高
    categoryTableView.rowHeight = 60;
    
    
    //设置数据源和代理
    categoryTableView.delegate = self;
    categoryTableView.dataSource = self;
    
    //注册cell
    [categoryTableView registerClass:[YTShopOrderGategoryCell class] forCellReuseIdentifier:categoryTableViewID];
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //初始选择第一行
    [categoryTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    
    _categoryTableView = categoryTableView;
    
}
//设置右边的foodTableView
- (void)settingFoodTableView
{
    UITableView *footTableView = [[UITableView alloc] init];
    [self.view addSubview:footTableView];
    
    //设置约束
    [footTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.offset(0);
        make.left.equalTo(_categoryTableView.mas_right).offset(0);
        
        make.bottom.equalTo(_shopCar.mas_top).offset(0);

    }];
    
    //设置头部视图行高
    footTableView.sectionHeaderHeight = 30;
    
    
    
    //设置数据源和代理
    footTableView.delegate = self;
    footTableView.dataSource = self;
    //开启预估行高
    footTableView.estimatedRowHeight = 120;
    
    //注册cell
    [footTableView registerNib:[UINib nibWithNibName:@"YTShopOrderFoodCell" bundle:nil] forCellReuseIdentifier:foodTableViewID];
    
    
    //注册头部视图
    [footTableView registerClass:[YTTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:foodTableHeaderViewID];
    
    
    _foodTableView = footTableView;
}


#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(_foodTableView == tableView)
    {
        return _foodDate.count;
    }
    
    return 1;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_categoryTableView == tableView)
    {
        return _foodDate.count;
    }
    return _foodDate[section].spus.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_categoryTableView == tableView)
    {
        YTShopOrderGategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryTableViewID forIndexPath:indexPath];
        
        cell.textLabel.text = _foodDate[indexPath.row].name;
        
        return cell;
    }
    
    YTShopOrderFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:foodTableViewID forIndexPath:indexPath];
    
    //设置代理(将countView抛出)
    cell.countView.delegate = self;
    
    
    //赋值:
    cell.shopOrderFoodModel = _foodDate[indexPath.section].spus[indexPath.row];
    
    
    //    NSLog(@"%zd --- %zd",indexPath.section,indexPath.row);
        //cell.textLabel.text = _foodDate[indexPath.section].spus[indexPath.row].name;
    
//    YTShopOrderGategoryModel *shopOrdergategoryModel = _foodDate[indexPath.section];
//    YTShopOrderFoodModel *shopOrderFoodModel = shopOrdergategoryModel.spus[indexPath.row];
//    cell.textLabel.text = shopOrderFoodModel.name;
    
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    YTTableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:foodTableHeaderViewID];
    //设置数据:
    headerView.shopOrderGategoryModel = _foodDate[section];
    
    return headerView;
}

///点击下取消
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(_foodTableView == tableView)
    {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
#pragma mark - 点击跳转食物详情界面
        
        YTFoodDetailController *foodDetailController = [[YTFoodDetailController alloc] init];
        //传数据
        foodDetailController.foodDate = _foodDate;
        //传索引
        foodDetailController.indexPath = indexPath;
        
        //给食物详情购物车传数据(_shopCarModel不能用,不然会有个NIll)
        foodDetailController.shopCarModel = self.shopCarModel;
        
        [self.navigationController pushViewController:foodDetailController animated:YES];
        
 
    }
    
    if(_categoryTableView == tableView)
    {
        _tableGategoryTableViewClick = YES;
        NSIndexPath *foodIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        [_foodTableView selectRowAtIndexPath:foodIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
    
    
    
}


///一直滚动方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //先判断哪个表格滚动,可以得到可见的索引, food组  gategory行
    if(_foodTableView == scrollView && _tableGategoryTableViewClick == NO)
    {
        NSIndexPath *indexPathTop = [[_foodTableView indexPathsForVisibleRows]firstObject];
        
        NSIndexPath *categoryIndexPath = [NSIndexPath indexPathForRow:indexPathTop.section inSection:0];
        //NSLog(@"%zd",categoryIndexPath.row);
        
        //好东西,一点点都是技巧呀.
        [_categoryTableView selectRowAtIndexPath:categoryIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    }
    
    
}

//结束动漫滚动把点击值恢复
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    _tableGategoryTableViewClick = NO;
}


#warning mark - countView代理方法.
///实现代理的方法
- (void)countViewValueChage:(YTCountView *)countView
{
    //根据传出的类型来判断值
    switch (countView.type) {
        case YTCountViewBtnTypeAddBtn:
            //存模型
            [self.shopCarModel.shopfoodModelArr addObject:countView.foodModel];
            
            //NSLog(@"%@",self.shopCarModel.shopfoodModelArr);
            
            //坐标转换
            CGPoint starPoint = [countView convertPoint:countView.addBtn.center toView:_shopCar];
            
            //调用动漫方法
            [self.shopCar animWithStarPoint:starPoint];
            
            
            
            
            
            break;
        case YTCountViewBtnTypeMinusBtn:
            //存模型
            [self.shopCarModel.shopfoodModelArr removeObjectAtIndex:[_shopCar.shopCarModel.shopfoodModelArr indexOfObject:countView.foodModel]];
            
            //NSLog(@"%@",self.shopCarModel.shopfoodModelArr);
            
            break;

            
        default:
            break;
    }
    
    //传值给shopCarView
    _shopCar.shopCarModel = self.shopCarModel;
}

//实例化模型
- (YTShopCarModel *)shopCarModel
{
    if(_shopCarModel == nil)
    {
        _shopCarModel = [[YTShopCarModel alloc] init];
    }
    return _shopCarModel;
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
