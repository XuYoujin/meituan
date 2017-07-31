//
//  NSObject+LinearFormula.h
//  meituan
//
//  Created by 徐友金 on 2017/7/31.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

struct YTValue {
    CGFloat consult;
    CGFloat result;
};
typedef struct YTValue YTValue;

CG_INLINE YTValue
YTValueMake(CGFloat consult, CGFloat result)
{
    YTValue value; value.consult = consult; value.result = result; return value;
}




@interface NSObject (LinearFormula)
//- (CGFloat)resultWithConsult1:(CGFloat)consult1 andResult1:(CGFloat)result1 andConsult2:(CGFloat)consult2 andResult2:(CGFloat)result2;

- (CGFloat)resultWithValue1:(YTValue)value1 andValue2:(YTValue)value2;

@end
