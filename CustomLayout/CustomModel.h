//
//  CustomModel.h
//  CustomLayout
//
//  Created by Leo on 2017/10/17.
//  Copyright © 2017年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomModel : NSObject

/**
 是否横屏 默认否 竖屏
 */
@property (nonatomic, assign) BOOL isLandscape;

@property (nonatomic, assign) NSInteger tag;

@property (nonatomic, assign) NSInteger type;

@end
