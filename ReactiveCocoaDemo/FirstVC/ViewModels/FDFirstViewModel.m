//
//  FDFirstViewModel.m
//  ReactiveCocoaDemo
//
//  Created by 伏董 on 2017/4/10.
//  Copyright © 2017年 伏董. All rights reserved.
//

#import "FDFirstViewModel.h"

@interface FDFirstViewModel ()

@end

@implementation FDFirstViewModel

- (instancetype)init{

    if (self = [super init]) {
        
        self.requestSingal = [RACSubject subject];
        self.cellClickSingal = [RACSubject subject];
    }

    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)send{

    NSLog(@"sendnext ");
    
    FDFirstModel *model = [[FDFirstModel alloc] init];
    model.name = @"123";
    model.phone = @"12312312312312";
    
    FDFirstModel *model1 = [[FDFirstModel alloc] init];
    model1.name = @"23123";
    model1.phone = @"fasdfasfsf";
    
    NSArray *array = [NSArray arrayWithObjects:model,model1, nil];
    [self.requestSingal sendNext:array];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
