//
//  FDFirstViewController.m
//  ReactiveCocoaDemo
//
//  Created by 伏董 on 2017/4/7.
//  Copyright © 2017年 伏董. All rights reserved.
//

#import "FDFirstViewController.h"
#import "FDFirstViewModel.h"
#import "FDFirstTableView.h"
#import "SecondViewController.h"


@interface FDFirstViewController ()

@property (nonatomic,strong) FDFirstViewModel *viewModel;
@property (nonatomic,strong) FDFirstTableView *tableView;


@end

@implementation FDFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"1";

    [self createUI];
}

- (void)createUI{
    
    self.viewModel = [[FDFirstViewModel alloc] init];

    [self.view addSubview:self.tableView];
    
    @weakify(self);
    
    [self.viewModel.requestSingal subscribeNext:^(id x) {
       
        @strongify(self);
        self.tableView.messageArray = x;
        NSLog(@"subscribenext  ");

    }];
    
    [self.viewModel.cellClickSingal subscribeNext:^(id x) {

        NSLog(@"click cell ");
        @strongify(self);
        
        SecondViewController *secondVC = [[SecondViewController alloc] init];
        [self.navigationController pushViewController:secondVC animated:YES];

    }];
    
    [self.viewModel send];
    
}

- (FDFirstTableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[FDFirstTableView alloc] initWithFrame:self.view.frame ViewModel:self.viewModel];
    }
    
    return _tableView;
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
