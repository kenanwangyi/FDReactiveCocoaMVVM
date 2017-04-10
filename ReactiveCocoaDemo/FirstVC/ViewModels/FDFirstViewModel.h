//
//  FDFirstViewModel.h
//  ReactiveCocoaDemo
//
//  Created by 伏董 on 2017/4/10.
//  Copyright © 2017年 伏董. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDFirstModel.h"

@interface FDFirstViewModel : UIViewController

@property (nonatomic,strong) RACSubject *requestSingal;//网络请求信号
@property (nonatomic,strong) RACSubject *cellClickSingal;//cell点击信号

- (void)send;

@end
