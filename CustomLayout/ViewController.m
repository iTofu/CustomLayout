//
//  ViewController.m
//  CustomLayout
//
//  Created by Leo on 2017/10/17.
//  Copyright © 2017年 Leo. All rights reserved.
//

#import "ViewController.h"
#import "CustomModel.h"
#import "CustomCell.h"
#import "CustomLayout.h"

static NSString *CellReuseID = @"cell";

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) CustomLayout *layout;
@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray<CustomModel *> *models;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.models = [[NSMutableArray alloc] init];
    [self.models addObjectsFromArray:[self generateCustomModels]];
    
    CustomLayout *layout = [[CustomLayout alloc] init];
    layout.models = self.models;
    [layout autoGenerateAttrs];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:CellReuseID];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addBtn.frame = CGRectMake(kScreenW - 44.0 - 15.0, 30.0, 44.0, 44.0);
    [addBtn addTarget:self action:@selector(addModels) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    self.layout = layout;
    self.collectionView = collectionView;
}

- (void)addModels {
    [self.models addObjectsFromArray:[self generateCustomModels]];
//    self.layout.forcedAlignment = YES;
    self.layout.models = self.models;
    [self.layout autoGenerateAttrs];
    [self.collectionView reloadData];
}

- (NSArray<CustomModel *> *)generateCustomModels {
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        CustomModel *model = [[CustomModel alloc] init];
        model.tag = self.models.count + i;
        model.isLandscape = arc4random() % 2;
        [arrM addObject:model];
    }
    return [NSArray arrayWithArray:arrM];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.layout.attrs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellReuseID forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%d", (int)[self.models[indexPath.item] tag]];
    return cell;
}

@end
