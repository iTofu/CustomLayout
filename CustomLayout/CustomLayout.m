//
//  CustomLayout.m
//  CustomLayout
//
//  Created by Leo on 2017/10/17.
//  Copyright © 2017年 Leo. All rights reserved.
//

#import "CustomLayout.h"
#import "CustomModel.h"
#import "NSObject+VNi.h"

@interface CustomLayout ()

@property (nonatomic, assign) CGFloat bottom;

@end

@implementation CustomLayout

- (instancetype)init {
    if (self = [super init]) {
        self.attrs = [[NSArray alloc] init];
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    
//    [self autoGenerateAttrs];
}

- (void)autoGenerateAttrs {
    NSInteger itemsCount = self.models.count;
    CGFloat padding = 1.0;
    
    CGSize size1 = CGSizeMake((kScreenW - padding) * 0.5, (kScreenW - padding) * 0.5 * 123.0 / 187.0);
    CGSize size2 = CGSizeMake((kScreenW - padding) * 2.0 / 3.0, ((kScreenW - padding)  * 2.0 / 3.0) * 190.0 / 249.0);
    CGSize size4 = CGSizeMake(kScreenW, kScreenW * 187.0 / 375.0);
    
    CGSize size11 = CGSizeMake((kScreenW - padding * 2) / 3.0, (kScreenW - padding * 2) / 3.0 * 190.0 / 125.0);
    CGSize size12 = CGSizeMake((kScreenW - padding) / 3.0, size2.height);
    CGSize size14 = CGSizeMake((kScreenW - padding) * 0.5, (kScreenW - padding) * 0.5 * 272.0 / 187.0);
    
    CGFloat y = self.bottom;
    NSInteger startIndex = self.startIndex;
    if (self.lastModel) {
        self.lastModel = nil;
    }
    
    NSMutableArray<CustomModel *> *arrM = [NSMutableArray array];
    for (NSInteger i = startIndex; i < self.models.count; i++) {
        [arrM addObject:self.models[i]];
    }
    
    NSMutableArray<UICollectionViewLayoutAttributes *> *attrs = [NSMutableArray array];
    
    for (NSInteger i = startIndex; i < itemsCount; i++) {
        CustomModel *model1 = arrM[i - startIndex];
        if (model1.isLandscape) {
            // - ?
            if (i + 1 < itemsCount) {
                CustomModel *model2 = arrM[i + 1 - startIndex];
                if (model2.isLandscape) {
                    // - -
                    model1.type = 1;
                    model2.type = 1;
                    
                    CGRect frame1 = CGRectMake(0, y, size1.width, size1.height);
                    CGRect frame2 = CGRectMake(kScreenW - size1.width, y, size1.width, size1.height);
                    
                    UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                    UICollectionViewLayoutAttributes *attr2 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 1 inSection:0]];
                    
                    attr1.frame = frame1;
                    attr2.frame = frame2;
                    
                    [attrs addObject:attr1];
                    [attrs addObject:attr2];
                    
                    y = CGRectGetMaxY(frame2) + padding;
                    i += 1;
                } else {
                    if (i + 3 < itemsCount) {
                        CustomModel *model3 = arrM[i + 2 - startIndex];
                        CustomModel *model4 = arrM[i + 3 - startIndex];
                        if (!model3.isLandscape && model4.isLandscape) {
                            // - +
                            // + -
                            model1.type = 3;
                            model2.type = 3;
                            model3.type = 3;
                            model4.type = 3;
                            
                            CGRect frame1 = CGRectMake(0, y, size1.width, size1.height);
                            CGRect frame2 = CGRectMake(kScreenW - size14.width - 0.01, y, size14.width, size14.height);
                            CGRect frame3 = CGRectMake(0, CGRectGetMaxY(frame1) + padding, size14.width, size14.height);
                            CGRect frame4 = CGRectMake(kScreenW - size1.width - 0.01, CGRectGetMaxY(frame2) + padding, size1.width, size1.height);
                            
                            UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                            UICollectionViewLayoutAttributes *attr2 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 1 inSection:0]];
                            UICollectionViewLayoutAttributes *attr3 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 2 inSection:0]];
                            UICollectionViewLayoutAttributes *attr4 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 3 inSection:0]];
                            
                            attr1.frame = frame1;
                            attr2.frame = frame2;
                            attr3.frame = frame3;
                            attr4.frame = frame4;
                            
                            [attrs addObject:attr1];
                            [attrs addObject:attr2];
                            [attrs addObject:attr3];
                            [attrs addObject:attr4];
                            
                            y = CGRectGetMaxY(frame4) + padding;
                            i += 3;
                        } else {
                            // - +
                            model1.type = 2;
                            model2.type = 2;
                            
                            CGRect frame1 = CGRectMake(0, y, size2.width, size2.height);
                            CGRect frame2 = CGRectMake(kScreenW - size12.width - 0.01, y, size12.width, size12.height);
                            
                            UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                            UICollectionViewLayoutAttributes *attr2 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 1 inSection:0]];
                            
                            attr1.frame = frame1;
                            attr2.frame = frame2;
                            
                            [attrs addObject:attr1];
                            [attrs addObject:attr2];
                            
                            y = CGRectGetMaxY(frame2) + padding;
                            i += 1;
                        }
                    } else {
                        // - +
                        model1.type = 2;
                        model2.type = 2;
                        
                        CGRect frame1 = CGRectMake(0, y, size2.width, size2.height);
                        CGRect frame2 = CGRectMake(kScreenW - size12.width - 0.01, y, size12.width, size12.height);
                        
                        UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                        UICollectionViewLayoutAttributes *attr2 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 1 inSection:0]];
                        
                        attr1.frame = frame1;
                        attr2.frame = frame2;
                        
                        [attrs addObject:attr1];
                        [attrs addObject:attr2];
                        
                        y = CGRectGetMaxY(frame2) + padding;
                        i += 1;
                    }
                }
            } else {
                // 多余一个 -
                if (self.isForcedAlignment) {
                    model1.type = 4;
                    
                    CGRect frame1 = CGRectMake(0, y, size4.width, size4.height);
                    
                    UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                    
                    attr1.frame = frame1;
                    
                    [attrs addObject:attr1];
                    
                    y = CGRectGetMaxY(frame1) + padding;
                } else {
                    self.lastModel = model1;
                }
            }
        } else {
            // + ?
            if (i + 1 < itemsCount) {
                CustomModel *model2 = arrM[i + 1 - startIndex];
                if (!model2.isLandscape) {
                    if (i + 2 < itemsCount) {
                        CustomModel *model3 = arrM[i + 2 - startIndex];
                        if (!model3.isLandscape) {
                            // + + +
                            model1.type = 11;
                            model2.type = 11;
                            model3.type = 11;
                            
                            CGRect frame1 = CGRectMake(0, y, size11.width, size11.height);
                            CGRect frame2 = CGRectMake(CGRectGetMaxX(frame1) + padding - 0.01, y, size11.width, size11.height);
                            CGRect frame3 = CGRectMake(kScreenW - size11.width - 0.01, y, size11.width, size11.height);
                            
                            UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                            UICollectionViewLayoutAttributes *attr2 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 1 inSection:0]];
                            UICollectionViewLayoutAttributes *attr3 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 2 inSection:0]];
                            
                            attr1.frame = frame1;
                            attr2.frame = frame2;
                            attr3.frame = frame3;
                            
                            [attrs addObject:attr1];
                            [attrs addObject:attr2];
                            [attrs addObject:attr3];
                            
                            y = CGRectGetMaxY(frame3) + padding;
                            i += 2;
                        } else {
                            // + +
                            model1.type = 15;
                            model2.type = 15;

                            CGRect frame1 = CGRectMake(0, y, size14.width, size14.height);
                            CGRect frame2 = CGRectMake(kScreenW - size14.width, y, size14.width, size14.height);

                            UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                            UICollectionViewLayoutAttributes *attr2 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 1 inSection:0]];

                            attr1.frame = frame1;
                            attr2.frame = frame2;

                            [attrs addObject:attr1];
                            [attrs addObject:attr2];

                            y = CGRectGetMaxY(frame2) + padding;
                            i += 1;
                        }
                    } else {
                        // + +
                        model1.type = 15;
                        model2.type = 15;
                        
                        CGRect frame1 = CGRectMake(0, y, size14.width, size14.height);
                        CGRect frame2 = CGRectMake(kScreenW - size14.width, y, size14.width, size14.height);
                        
                        UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                        UICollectionViewLayoutAttributes *attr2 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 1 inSection:0]];
                        
                        attr1.frame = frame1;
                        attr2.frame = frame2;
                        
                        [attrs addObject:attr1];
                        [attrs addObject:attr2];
                        
                        y = CGRectGetMaxY(frame2) + padding;
                        i += 1;
                    }
                } else {
                    if (i + 3 < itemsCount) {
                        CustomModel *model3 = arrM[i + 2 - startIndex];
                        CustomModel *model4 = arrM[i + 3 - startIndex];
                        if (model3.isLandscape && !model4.isLandscape) {
                            // + -
                            // - +
                            model1.type = 13;
                            model2.type = 13;
                            model3.type = 13;
                            model4.type = 13;
                            
                            CGRect frame1 = CGRectMake(0, y, size14.width, size14.height);
                            CGRect frame2 = CGRectMake(kScreenW - size1.width - 0.01, y, size1.width, size1.height);
                            CGRect frame3 = CGRectMake(0, CGRectGetMaxY(frame1) + padding, size1.width, size1.height);
                            CGRect frame4 = CGRectMake(kScreenW - size14.width - 0.01, CGRectGetMaxY(frame2) + padding, size14.width, size14.height);
                            
                            UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                            UICollectionViewLayoutAttributes *attr2 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 1 inSection:0]];
                            UICollectionViewLayoutAttributes *attr3 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 2 inSection:0]];
                            UICollectionViewLayoutAttributes *attr4 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 3 inSection:0]];
                            
                            attr1.frame = frame1;
                            attr2.frame = frame2;
                            attr3.frame = frame3;
                            attr4.frame = frame4;
                            
                            [attrs addObject:attr1];
                            [attrs addObject:attr2];
                            [attrs addObject:attr3];
                            [attrs addObject:attr4];
                            
                            y = CGRectGetMaxY(frame4) + padding;
                            i += 3;
                        } else {
                            // + -
                            model1.type = 12;
                            model2.type = 12;
                            
                            CGRect frame1 = CGRectMake(0, y, size12.width, size12.height);
                            CGRect frame2 = CGRectMake(kScreenW - size2.width - 0.01, y, size2.width, size2.height);
                            
                            UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                            UICollectionViewLayoutAttributes *attr2 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 1 inSection:0]];
                            
                            attr1.frame = frame1;
                            attr2.frame = frame2;
                            
                            [attrs addObject:attr1];
                            [attrs addObject:attr2];
                            
                            y = CGRectGetMaxY(frame2) + padding;
                            i += 1;
                        }
                    } else {
                        // + -
                        model1.type = 12;
                        model2.type = 12;
                        
                        CGRect frame1 = CGRectMake(0, y, size12.width, size12.height);
                        CGRect frame2 = CGRectMake(kScreenW - size2.width - 0.01, y, size2.width, size2.height);
                        
                        UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                        UICollectionViewLayoutAttributes *attr2 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i + 1 inSection:0]];
                        
                        attr1.frame = frame1;
                        attr2.frame = frame2;
                        
                        [attrs addObject:attr1];
                        [attrs addObject:attr2];
                        
                        y = CGRectGetMaxY(frame2) + padding;
                        i += 1;
                    }
                }
            } else {
                // 多余一个 +
                if (self.isForcedAlignment) {
                    model1.type = 14;
                    
                    CGRect frame1 = CGRectMake(0, y, size14.width, size14.height);
                    
                    UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                    
                    attr1.frame = frame1;
                    
                    [attrs addObject:attr1];
                    
                    y = CGRectGetMaxY(frame1) + padding;
                } else {
                    self.lastModel = model1;
                }
            }
        }
    }
    
    self.bottom = y;
    self.startIndex = self.models.count - (self.lastModel ? 1 : 0);
    
    NSMutableArray *attrsM = [NSMutableArray arrayWithArray:self.attrs];
    [attrsM addObjectsFromArray:attrs];
    self.attrs = [NSArray arrayWithArray:attrsM];
}

- (void)setModels:(NSArray<CustomModel *> *)models {
    _models = models;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, MAX(self.bottom, self.collectionView.bounds.size.height));
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attrs = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attr in self.attrs) {
        if (CGRectIntersectsRect(rect, attr.frame)) {
            [attrs addObject:attr];
        }
    }
    return [NSArray arrayWithArray:attrs];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = self.attrs[indexPath.item];
    return attributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return NO;
}

@end
