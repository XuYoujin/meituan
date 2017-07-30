//
//  YTShopController.m
//  meituan
//
//  Created by 徐友金 on 2017/7/30.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopController.h"
#import "YTFoodDetailController.h"
@interface YTShopController ()

@end

@implementation YTShopController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.navitem.title = @"商店";
    
}

//测试点击跳转下面界面
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    YTFoodDetailController *foodDetailController = [[YTFoodDetailController alloc] init];
    [self.navigationController pushViewController:foodDetailController animated:YES];
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
