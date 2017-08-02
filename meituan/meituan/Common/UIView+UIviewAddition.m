//
//  UIView+UIviewAddition.m
//  meituan
//
//  Created by 徐友金 on 2017/8/3.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "UIView+UIviewAddition.h"

@implementation UIView (UIviewAddition)
- (UIViewController *)viewController
{
    UIResponder *resp = [self nextResponder];
    
    while (resp) {
        
        if([resp isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)resp;
            
        }
        else
            resp = [resp nextResponder];
        
        
    }
    return nil;
}
@end
