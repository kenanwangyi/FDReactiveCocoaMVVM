//
//  SecondViewController.m
//  ReactiveCocoaDemo
//
//  Created by 伏董 on 2017/4/10.
//  Copyright © 2017年 伏董. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondView.h"

@interface SecondViewController ()

@property (nonatomic,strong) SecondView *secondView;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"2";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (SecondView *)secondView{

    if(!_secondView){
        _secondView = [[SecondView alloc] initWithFrame:self.view.bounds];
    }

    return _secondView;
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
