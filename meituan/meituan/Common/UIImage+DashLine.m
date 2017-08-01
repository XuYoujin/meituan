//
//  UIImage+DashLine.m
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "UIImage+DashLine.h"

@implementation UIImage (DashLine)
+ (instancetype)dashLineViewWithColor:(UIColor *)color
{
    //开启图片类型上下文(YES,能变成黑色.)
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(4, 1), NO, 0);
    
    //获取图片类型上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //划线
    CGContextMoveToPoint(ctx, 0, 1);
    CGContextAddLineToPoint(ctx, 4, 1);
    //设置虚线样式
    
    CGFloat lengths[] = {2,2};
    
    CGContextSetLineDash(ctx, 0, lengths, 2);
    
    //设置颜色
    [color set];
    
    //渲染
    CGContextStrokePath(ctx);
    
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上文
    UIGraphicsEndPDFContext();
    //返回值
    return image;
    
}
@end
