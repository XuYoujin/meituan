//
//  YTShopOrderController.m
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopOrderController.h"

@interface YTShopOrderController ()

//设置组视图属性
@property (nonatomic,weak)UITableView *categoryTableView;
//设置食物视图属性
@property (nonatomic,weak)UITableView *foodTableView;

@end

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
    
    _foodTableView = footTableView;
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
