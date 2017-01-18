//
//  UIFont+ChangeFont.m
//  ChangeFont
//
//  Created by 侯猛 on 2017/1/18.
//  Copyright © 2017年 侯猛. All rights reserved.
//

#import "UIFont+ChangeFont.h"
#import <objc/runtime.h>

@implementation UIFont (ChangeFont)

+ (void)load
{
    Class class                      = [self class];
    
    SEL systemFontOfSizeSelector     = @selector(systemFontOfSize:);
    SEL newSystemFontOfSizeSelector  = @selector(customsystemFontOfSize:);
    
    Method systemFontOfSizeMethod    = class_getClassMethod(class, systemFontOfSizeSelector);
    Method newSystemFontOfSizeMethod = class_getClassMethod(class, newSystemFontOfSizeSelector);
    
    method_exchangeImplementations(systemFontOfSizeMethod, newSystemFontOfSizeMethod);
}

+ (UIFont *)customsystemFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"HYi3gf" size:fontSize];
}

@end
