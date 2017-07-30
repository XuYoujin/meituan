//
//  YTBaseController.m
//  meituan
//
//  Created by 徐友金 on 2017/7/30.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTBaseController.h"

@interface YTBaseController ()

@end

@implementation YTBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加在父控件上
    [self.view addSubview:_navigationBar];
    
    //设置约束
    [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
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
        
        UINavigationBar *navigationBar = [[UINavigationBar alloc] init];
        
        
        //设置导航item
        UINavigationItem *item = [[UINavigationItem alloc] init];
        
        //设置导航条和导航Item的关系
        
        navigationBar.items = @[item];
        
        
        
        //赋值
        _navigationBar = navigationBar;
        _navitem = item;
        
        

    }
    
    return self;
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
