//
//  FDFirstTableView.h
//  ReactiveCocoaDemo
//
//  Created by 伏董 on 2017/4/7.
//  Copyright © 2017年 伏董. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDFirstViewModel.h"

@interface FDFirstTableView : UIView

@property (nonatomic,strong) NSArray *messageArray;

- (instancetype)initWithFrame:(CGRect)frame ViewModel:(FDFirstViewModel *)model;



@end
