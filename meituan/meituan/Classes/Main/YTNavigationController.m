//
//  YTNavigationController.m
//  meituan
//
//  Created by 徐友金 on 2017/7/30.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTNavigationController.h"
#import "YTBaseController.h"
@interface YTNavigationController ()

@end

@implementation YTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //导航控制器隐藏导航条
    self.navigationBar.hidden = YES;
    
    
    
    
}



//重写push方法,让非根导航控制器有返回按钮
- (void)pushViewController:(YTBaseController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
    if(self.childViewControllers.count > 1)
    {
        //让子控制器加返回按钮
        viewController.navitem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_backItem"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    
    
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}


//让栈顶控制器能改变导航条
- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
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
