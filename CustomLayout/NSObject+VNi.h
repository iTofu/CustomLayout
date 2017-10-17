//
//  NSObject+VNi.h
//  VNi
//
//  Created by Johnil on 2017/2/21.
//  Copyright © 2017年 Johnil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (VNi)

- (void)associateValue:(id)value withKey:(const void *)key;
- (id)associatedValueForKey:(const void *)key;

@end
