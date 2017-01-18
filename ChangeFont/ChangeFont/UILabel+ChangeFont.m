//
//  UILabel+ChangeFont.m
//  ChangeFont
//
//  Created by 侯猛 on 2017/1/18.
//  Copyright © 2017年 侯猛. All rights reserved.
//

#import "UILabel+ChangeFont.h"
#import <objc/runtime.h>

@implementation UILabel (ChangeFont)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class                    = [self class];
        
        /* 获取系统类方法 */
        SEL originalInitSelector       = @selector(init);
        SEL originalInitFrameSelector  = @selector(initWithFrame:);
        SEL originalNibSelector        = @selector(awakeFromNib);
        
        /* 获取自定义类方法 */
        SEL newInitSelector            = @selector(newInit);
        SEL newInitFrameSelector       = @selector(newInitWithFrame:);
        SEL newNibSelector             = @selector(newAwakeFromNib);
        
        /* 得到类的实例方法 */
        Method originalInitMethod      = class_getInstanceMethod(class, originalInitSelector);
        Method originalInitFrameMethod = class_getInstanceMethod(class, originalInitFrameSelector);
        Method originalNibMethod       = class_getInstanceMethod(class, originalNibSelector);
        
        /* 得到类的类方法 */
        Method newInitMethod           = class_getInstanceMethod(class, newInitSelector);
        Method newInitFrameMethod      = class_getInstanceMethod(class, newInitFrameSelector);
        Method newNibMethod            = class_getInstanceMethod(class, newNibSelector);
        
        BOOL addInitMethod             =
        class_addMethod(class,
                        originalInitSelector,
                        method_getImplementation(newInitMethod),
                        method_getTypeEncoding(newInitMethod));
        
        BOOL addInitFrameMethod        =
        class_addMethod(class,
                        originalInitFrameSelector,
                        method_getImplementation(newInitFrameMethod),
                        method_getTypeEncoding(newInitFrameMethod));
        BOOL addNibMethod              =
        class_addMethod(class,
                        originalNibSelector,
                        method_getImplementation(newNibMethod),
                        method_getTypeEncoding(newNibMethod));
        
        
        if (addInitMethod) {
            class_replaceMethod(class,
                                newInitSelector,
                                method_getImplementation(originalInitMethod),
                                method_getTypeEncoding(originalInitMethod));
        } else {
            method_exchangeImplementations(originalInitMethod,
                                           newInitMethod);
        }
        
        if (addInitFrameMethod) {
            class_replaceMethod(class,
                                newInitFrameSelector,
                                method_getImplementation(originalInitFrameMethod),
                                method_getTypeEncoding(originalInitFrameMethod));
        }else {
            method_exchangeImplementations(originalInitFrameMethod,
                                           newInitFrameMethod);
        }
        
        if (addNibMethod) {
            class_replaceMethod(class,
                                newNibSelector,
                                method_getImplementation(originalNibMethod),
                                method_getTypeEncoding(originalNibMethod));
        }else {
            method_exchangeImplementations(originalNibMethod,
                                           newNibMethod);
        }
    });
    
}


- (instancetype)newInit
{
    id __self     = [self newInit];
    if (self) {
        self.font = [UIFont fontWithName:@"HYi3gf" size:self.font.pointSize];
    }
    return __self;
}

-(instancetype)newInitWithFrame:(CGRect)rect{
    id __self     = [self newInitWithFrame:rect];
    if (self) {
        self.font = [UIFont fontWithName:@"HYi3gf" size:self.font.pointSize];
    }
    return __self;
}

-(void)newAwakeFromNib{
    [self newAwakeFromNib];
    if (self) {
        self.font = [UIFont fontWithName:@"HYi3gf" size:self.font.pointSize];
    }
}

@end
