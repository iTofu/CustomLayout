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

@property (nonatomic, assign) NSInteger startIndex;
@property (nonatomic, strong) CustomModel *lastModel;

@property (nonatomic, strong) NSArray<CustomModel *> *models;

- (void)appendModels:(NSArray<CustomModel *> *)models;

- (void)generateAttrsWithModels;

@end
