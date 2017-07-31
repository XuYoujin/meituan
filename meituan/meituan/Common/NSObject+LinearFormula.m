//
//  NSObject+LinearFormula.m
//  meituan
//
//  Created by 徐友金 on 2017/7/31.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "NSObject+LinearFormula.h"


@implementation NSObject (LinearFormula)



- (CGFloat)resultWithValue1:(YTValue)value1 andValue2:(YTValue)value2
{
    CGFloat a = (value1.result - value2.result) / (value1.consult - value2.consult);
    
        CGFloat b = value1.result - a * value1.consult;
    
        return a * [(NSNumber *)self floatValue]  + b;
        

}



//- (CGFloat)resultWithConsult1:(CGFloat)consult1 andResult1:(CGFloat)result1 andConsult2:(CGFloat)consult2 andResult2:(CGFloat)result2
//{
//    
//    CGFloat a = (result1 - result2) / (consult1 - consult2);
//    
//    CGFloat b = result1 - a * consult1;
//    
//    return a * [(NSNumber *)self floatValue]  + b;
//    
//    
//}




@end
