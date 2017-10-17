//
//  NSObject+VNi.m
//  VNi
//
//  Created by Johnil on 2017/2/21.
//  Copyright © 2017年 Johnil. All rights reserved.
//

#import "NSObject+VNi.h"
#import <objc/runtime.h>

@implementation NSObject (VNi)

- (void)associateValue:(id)value withKey:(const void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedValueForKey:(const void *)key{
    id value = objc_getAssociatedObject(self, key);
    return value;
}

@end
