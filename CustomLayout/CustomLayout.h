//
//  CustomLayout.h
//  CustomLayout
//
//  Created by Leo on 2017/10/17.
//  Copyright © 2017年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenSize [UIScreen mainScreen].bounds.size
#define kScreenW    kScreenSize.width
#define kScreenH    kScreenSize.height

@class CustomModel;

@interface CustomLayout : UICollectionViewFlowLayout

/**
 当前的 attrs
 */
@property (nonatomic, strong) NSArray<UICollectionViewLayoutAttributes *> *attrs;

/**
 需要开始渲染的 index, 初始化/下拉刷新置 0, 渲染时自动后移，加载更多时不要手动更改
 */
@property (nonatomic, assign) NSInteger startIndex;
/**
 未对齐的多出的 Model
 */
@property (nonatomic, strong) CustomModel *lastModel;

/**
 Models
 */
@property (nonatomic, strong) NSArray<CustomModel *> *models;
/**
 是否强制对齐, 如果 YES, 最后一个多出的 Model 将会被强制渲染对齐
 */
@property (nonatomic, assign, getter=isForcedAlignment) BOOL forcedAlignment;

/**
 根据 Models 生成 Attrs
 */
- (void)autoGenerateAttrs;

@end
