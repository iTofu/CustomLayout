//
//  CustomCell.m
//  CustomLayout
//
//  Created by Leo on 2017/10/17.
//  Copyright © 2017年 Leo. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor redColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0, 26.0)];
        label.font = [UIFont systemFontOfSize:24.0];
        label.textColor = [UIColor whiteColor];
        [self.contentView addSubview:label];
        
        self.label = label;
    }
    return self;
}

@end
