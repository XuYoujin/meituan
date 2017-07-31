//
//  YTBaseController.m
//  meituan
//
//  Created by 徐友金 on 2017/7/30.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTBaseController.h"
#import "YTNavigationBar.h"
@interface YTBaseController ()

@end

@implementation YTBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加在父控件上
    [self.view addSubview:_naviBar];
    
    //设置约束
    [_naviBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(64);
        
    }];

    
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self =  [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if(self)
    {
        //设置导航条
        
        YTNavigationBar *navigationBar = [[YTNavigationBar alloc] init];
        
        
        //设置导航item
        UINavigationItem *item = [[UINavigationItem alloc] init];
        
        //设置导航条和导航Item的关系
        
        navigationBar.items = @[item];
        
        
        
        //赋值
        _naviBar = navigationBar;
        _navitem = item;
        
        

    }
    
    return self;
}
//重新set方法状态栏状态
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
    _statusBarStyle = statusBarStyle;
    
    
    [self setNeedsStatusBarAppearanceUpdate];
   
}

//设置状态栏样式 (只能通过方法设置状态栏)
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return _statusBarStyle;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    //是否加载
    if(self.isViewLoaded && self.view.window == nil)
    {
        self.view = nil;
    }
    
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
