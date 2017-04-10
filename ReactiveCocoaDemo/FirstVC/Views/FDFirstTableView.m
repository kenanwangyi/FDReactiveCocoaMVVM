//
//  FDFirstTableView.m
//  ReactiveCocoaDemo
//
//  Created by 伏董 on 2017/4/7.
//  Copyright © 2017年 伏董. All rights reserved.
//

#import "FDFirstTableView.h"


@interface FDFirstTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) FDFirstViewModel *viewModel;


@end

@implementation FDFirstTableView

- (instancetype)initWithFrame:(CGRect)frame ViewModel:(FDFirstViewModel *)model{
    
    self = [self initWithFrame:frame];
    self.viewModel = model;
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.tableView = [ToolsView createTableViewWithFrame:frame withStyle:UITableViewStylePlain withDelegate:self withDataSource:self withBackgroundColor:[UIColor whiteColor] withShowsHorizontalScrollIndicator:NO withShowsVerticalScrollIndicator:NO withScrollEnabled:YES];
        
        self.tableView.tableFooterView = [[UIView alloc] init];
        
        [self addSubview:self.tableView];
    }
    
    return self;
}


- (void)setMessageArray:(NSArray *)messageArray{

    _messageArray = messageArray;
    [self.tableView reloadData];
    
}


#pragma mark -tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    FDFirstModel *model = [self.messageArray objectAtIndex:indexPath.row];
    cell.textLabel.text = model.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.viewModel.cellClickSingal sendNext:nil];

}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
