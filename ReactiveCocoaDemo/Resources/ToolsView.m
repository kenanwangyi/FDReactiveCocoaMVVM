//
//  ToolsView.m
//  FlyChina
//
//  Created by 伏董 on 16/4/26.
//  Copyright © 2016年 伏董. All rights reserved.
//

#import "ToolsView.h"

static CGRect oldframe;

#define xScaleiPhone6 ([UIScreen mainScreen].bounds.size.width)/320
#define yScaleiPhone6 ([UIScreen mainScreen].bounds.size.height)/568
#define xScaleiPhone5 1.0
#define yScaleiPhone5 1.0

#define NUMBERS @"0123456789"
#define NUMBERSDecimal @"0123456789."

@implementation ToolsView


+ (NSInteger)currentScreenHeight{
    return [UIScreen mainScreen].bounds.size.height;
}

+ (NSInteger)currentScreenWidth{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)setXpoint:(CGFloat)x{
    if ([self currentScreenHeight] > 480) {
        return x*xScaleiPhone6;
    }else{
        return x*xScaleiPhone5;
    }
}

+ (CGFloat)setYpoint:(CGFloat)y{
    if ([self currentScreenHeight] > 480) {
        return y*yScaleiPhone6;
    }else{
        return y*yScaleiPhone5;
    }
}

+ (CGFloat)setWidth:(CGFloat)width{
    if ([self currentScreenHeight] > 480) {
        return width*xScaleiPhone6;
    }else{
        return width*xScaleiPhone5;
    }
}

+ (CGFloat)setHeight:(CGFloat)height{
    if ([self currentScreenHeight] > 480) {
        return height*yScaleiPhone6;
    }else{
        return height*yScaleiPhone5;
    }
}




+ (UILabel *)createLabelWithFrame:(CGRect)frame withText:(NSString *)text withTextAlignment:(NSTextAlignment)alignment withTextColor:(UIColor *)color{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textAlignment = alignment;
    label.textColor = color;
    return label;
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame withImage:(UIImage *)image  withCornerRedius:(CGFloat)redius{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.cornerRadius = redius;
    
    return imageView;
}


+ (UIButton *)createButtonWithFrame:(CGRect)frame withButtonType:(UIButtonType)type withColor:(UIColor *)color withTitle:(NSString *)title  withNormalImage:(UIImage *)normal withHighlightedImage:(UIImage *)highlighted withSelctedImage:(UIImage *)selceted withTarget:(nullable id)target withAction:(nonnull SEL)action withControlEvents:(UIControlEvents)contorlevents withCornerRadius:(CGFloat)radius{
    
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    [button setBackgroundColor:color];
    [button setImage:normal forState:UIControlStateNormal];
    [button setImage:selceted forState:UIControlStateSelected];
    [button setImage:highlighted forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:contorlevents];
    button.layer.cornerRadius = radius;
    return button;
}


+ (UITextField *)createTextFieldWithFrame:(CGRect)frame withPlaceholder:(NSString *)placeholder withDelegate:(id<UITextFieldDelegate>)delegate withClearButtonMode:(UITextFieldViewMode)mode withTextAlignment:(NSTextAlignment)alignment withTag:(NSInteger)tag withBackgroundColor:(UIColor *)color{
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.layer.cornerRadius = 3;
    textField.backgroundColor = [UIColor whiteColor];
    textField.delegate = delegate;
    textField.clearButtonMode = mode;
    textField.textAlignment = alignment;
    textField.tag = tag;
    textField.backgroundColor = color;
    
    return textField;
}

+ (UITableView *)createTableViewWithFrame:(CGRect)frame withStyle:(UITableViewStyle)style withDelegate:(id <UITableViewDelegate>)delegate withDataSource:(id <UITableViewDataSource>)source withBackgroundColor:(UIColor *)color withShowsHorizontalScrollIndicator:(BOOL)horizontal withShowsVerticalScrollIndicator:(BOOL)vertical withScrollEnabled:(BOOL)scroll{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    tableView.delegate = delegate;
    tableView.dataSource = source;
    tableView.backgroundColor = color;
    tableView.showsHorizontalScrollIndicator = horizontal;
    tableView.showsVerticalScrollIndicator = vertical;
    tableView.scrollEnabled = scroll;
    
    return tableView;
    
}

+ (UISegmentedControl *)createSegmentedControlWithFrame:(CGRect)frame withItemsArray:(NSArray *)array addTarget:(nullable id)target action:(nonnull SEL)action forControlEvents:(UIControlEvents)control withSelectedSegmentIndex:(NSInteger)index withTintColor:(UIColor *)color withBackgroundColor:(UIColor *)backColor{
    
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:array];
    segmentedControl.frame = frame;
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = color;
    segmentedControl.backgroundColor = backColor;
    [segmentedControl addTarget:target action:action forControlEvents:control];
    
    return segmentedControl;
}


+ (UIView *)createViewWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)color{
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    
    return view;
}


+ (UIView *)createDatePickerView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, [self currentScreenHeight] - [self setHeight:230], [self currentScreenWidth], [self setHeight:230])];
    
    view.backgroundColor = [UIColor lightGrayColor];
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, [self currentScreenWidth], [self setHeight:100])];
    [datePicker setDatePickerMode:UIDatePickerModeTime];
    datePicker.backgroundColor = [UIColor whiteColor];
    
    [view addSubview:datePicker];
    
    return view;
}


+ (UICollectionView *)createCollectionViewWithFrame:(CGRect)frame withCollectionViewLayout:(UICollectionViewLayout *)layout withDelegate:(id <UICollectionViewDelegate>)delgate withDateSource:(id <UICollectionViewDataSource>)dateSource witBbackgroundColor:(UIColor *)color{
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.delegate = delgate;
    collectionView.dataSource = dateSource;
    collectionView.backgroundColor = color;
    return collectionView;
}



+ (UIButton *)createCheckBoxViewWithFrame:(CGRect)frame withTarget:(nullable id)target action:(nonnull SEL)action forControlEvents:(UIControlEvents)control{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateSelected];
    button.selected = NO;
    [button addTarget:target  action:action forControlEvents:control];
    
    return button;
}

+ (void)showImage:(UIScrollView *)scrollView{
    
    UIScrollView *scroll = scrollView;
    
    scroll.userInteractionEnabled = NO;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    oldframe = [scroll convertRect:scrollView.bounds toView:window];
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = 0;
    scroll.tag = 1;
    [backgroundView addSubview:scroll];
    [window addSubview:backgroundView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    
    [backgroundView addGestureRecognizer: tap];
    
    [UIView animateWithDuration:0.3 animations:^{
        scroll.frame = window.frame;
        
        NSLog(@"frame  %@",NSStringFromCGRect(window.frame));
        backgroundView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

+ (void)hideImage:(UITapGestureRecognizer *)tap{
    
    UIView *backgroundView = tap.view;
    UIScrollView *scrollView = (UIScrollView *)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        scrollView.userInteractionEnabled = YES;
        NSLog(@"scrollview frame  %@",NSStringFromCGRect(scrollView.frame));

        [scrollView setFrame:oldframe];
        backgroundView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}


+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame showsHorizontalScrollIndicator:(BOOL)hori showsVerticalScrollIndicator:(BOOL)vert delgate:(id <UIScrollViewDelegate>)delegate{
    
    UIScrollView *scrollView = [[UIScrollView  alloc] initWithFrame:frame];
    scrollView.showsHorizontalScrollIndicator = hori;
    scrollView.showsVerticalScrollIndicator = vert;
    scrollView.delegate = delegate;
    
    
    return scrollView;
}

+ (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)parameter isNewFormat:(BOOL)format withView:(UIScrollView *)view success:(void (^)(id data))success failure:(void (^)(NSError *error))failure{
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
//    
//    [manager POST:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        if (format) {
//            
//            NSInteger code = [[responseObject objectForKey:@"ResultCode"] integerValue];
//            
//            if (code == 0) {
//                
//                if (success) {
//                    success(responseObject);
//                }
//                
//            }else if (code == 23){
//                
//                [SVProgressHUD showInfoWithStatus:[responseObject objectForKey:@"ErrMsg"]];
//            }else{
//                [SVProgressHUD showInfoWithStatus:@"系统错误，请重试！"];
//            }
//            
//        }else{
//            
//            success(responseObject);
//        }
//        
//        [view.mj_header endRefreshing];
//        [view.mj_footer endRefreshing];
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        [view.mj_header endRefreshing];
//        [view.mj_footer endRefreshing];
//        [SVProgressHUD dismiss];
//        
//        if (failure) {
//            
//            failure(error);
//            
//        }else{
//            
//            NSLog(@"error:%@",error.localizedDescription);
//            if ([error.localizedDescription isEqualToString:@"The request timed out."]) {
//                [SVProgressHUD showErrorWithStatus:@"请求超时，请检查网络连接"];
//            }
//        }
//    }];
    
}

+ (BOOL)isStringWhetherToNumber:(NSString *)string{
    
    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basicTest = [string isEqualToString:filtered];
    if(!basicTest) {
        return NO;
        
    }
    return YES;
}


+ (BOOL)isStringWhetherToNumberAndDecimal:(NSString *)string{
    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERSDecimal] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basicTest = [string isEqualToString:filtered];
    if(!basicTest) {
        return NO;
        
    }
    return YES;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
