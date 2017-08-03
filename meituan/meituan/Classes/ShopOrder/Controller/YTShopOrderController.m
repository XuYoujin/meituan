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

@interface YTShopOrderController ()<UITableViewDelegate,UITableViewDataSource>

//设置组视图属性
@property (nonatomic,weak)UITableView *categoryTableView;
//设置食物视图属性
@property (nonatomic,weak)UITableView *foodTableView;

@end

static NSString *categoryTableViewID = @"categoryTableViewID";
static NSString *foodTableViewID = @"foodTableViewID";


@implementation YTShopOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self setup];
    
}
//设置主界面
- (void)setup
{
    [self settingCategoryTableView];
    [self settingFoodTableView];
}

//设置左边categorytableView
- (void)settingCategoryTableView
{
    
    UITableView *categoryTableView = [[UITableView alloc] init];
    [self.view addSubview:categoryTableView];
    
    //设置约束
    [categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.offset(0);
        make.width.offset(100);
        
    }];
    
    //隐藏分割线
    categoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    
    //设置数据源和代理
    categoryTableView.delegate = self;
    categoryTableView.dataSource = self;
    
    //注册cell
    [categoryTableView registerClass:[YTShopOrderGategoryCell class] forCellReuseIdentifier:categoryTableViewID];
    
    
    _categoryTableView = categoryTableView;
    
}
//设置右边的foodTableView
- (void)settingFoodTableView
{
    UITableView *footTableView = [[UITableView alloc] init];
    [self.view addSubview:footTableView];
    
    //设置约束
    [footTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.offset(0);
        make.left.equalTo(_categoryTableView.mas_right).offset(0);
    }];
    
    //设置数据源和代理
    footTableView.delegate = self;
    footTableView.dataSource = self;
    
    
    //注册cell
    [footTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:foodTableViewID];
    
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:foodTableViewID forIndexPath:indexPath];
    
    //    NSLog(@"%zd --- %zd",indexPath.section,indexPath.row);
        cell.textLabel.text = _foodDate[indexPath.section].spus[indexPath.row].name;
    
//    YTShopOrderGategoryModel *shopOrdergategoryModel = _foodDate[indexPath.section];
//    YTShopOrderFoodModel *shopOrderFoodModel = shopOrdergategoryModel.spus[indexPath.row];
//    cell.textLabel.text = shopOrderFoodModel.name;
    
    
    return cell;
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
