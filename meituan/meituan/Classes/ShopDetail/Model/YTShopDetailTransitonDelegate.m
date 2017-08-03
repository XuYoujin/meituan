//
//  YTShopDetailTransitonDelegate.m
//  meituan
//
//  Created by 徐友金 on 2017/8/3.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopDetailTransitonDelegate.h"

typedef enum : NSUInteger {
    HMShopDetailAnimatorTransitionTypePresent,
    HMShopDetailAnimatorTransitionTypeDismiss,
} HMShopDetailAnimatorTransitionType;

@interface YTShopDetailTransitonDelegate ()<UIViewControllerAnimatedTransitioning>
//设置转场属性类型
@property (nonatomic,assign)HMShopDetailAnimatorTransitionType transitonType;
@end


@implementation YTShopDetailTransitonDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    _transitonType = HMShopDetailAnimatorTransitionTypePresent;

    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    _transitonType = HMShopDetailAnimatorTransitionTypeDismiss;
    return self;
}


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

//线实现下,等下研究下方法...(重新做下)  做个笔记
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    
    
    NSLog(@"-----");
    //得到来源视图
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    //得到目标视图
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    
    //获得转场的容器视图
    UIView *containerView = [transitionContext containerView];
    
    
    //把要转场的视图添加到,容器视图中
    [containerView addSubview:toView];
    
    
    
    switch (_transitonType) {
        case HMShopDetailAnimatorTransitionTypePresent:
        {
            toView.transform = CGAffineTransformMakeScale(0, 0);
            [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
                
                //toView.transform = CGAffineTransformMakeScale(1, 1);
      
                toView.transform = CGAffineTransformIdentity;
                
            } completion:^(BOOL finished) {
                
                [transitionContext completeTransition:YES];
                
            }];
            
            
        }
            break;
        case HMShopDetailAnimatorTransitionTypeDismiss:
        {
            [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
                fromView.transform = CGAffineTransformMakeScale(0.01, 0.01);
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
        }
            break;

        default:
            break;
    }
    
    
    
    
    
    
    
    
    
    
}



@end
