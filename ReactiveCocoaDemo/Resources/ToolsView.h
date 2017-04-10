//
//  ToolsView.h
//  FlyChina
//
//  Created by 伏董 on 16/4/26.
//  Copyright © 2016年 伏董. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCRENN_WIDTH  [ToolsView currentScreenWidth]
#define SCREEN_HEIGHT [ToolsView currentScreenHeight]
#define SETX(x)   [ToolsView setXpoint:x]
#define SETY(y) [ToolsView setYpoint:y]
#define SETW(w) [ToolsView setWidth:w]
#define SETH(h) [ToolsView setHeight:h]

@interface ToolsView : UIView

///当前版本对应的屏幕高度
+ (NSInteger)currentScreenHeight;

///当前版本对应的屏幕宽度
+ (NSInteger)currentScreenWidth;

///X
+ (CGFloat)setXpoint:(CGFloat)x;

///Y
+ (CGFloat)setYpoint:(CGFloat)y;

///Width
+ (CGFloat)setWidth:(CGFloat)width;

///Height
+ (CGFloat)setHeight:(CGFloat)height;





/**
 *  创建label
 *
 *  @param frame     frame description
 *  @param text      text description
 *  @param alignment alignment description
 *  @param color     color description
 *
 *  @return return value description
 */
+ (UILabel *)createLabelWithFrame:(CGRect)frame withText:(NSString *)text withTextAlignment:(NSTextAlignment)alignment withTextColor:(UIColor *)color;


/**
 *  创建imageview
 *
 *  @param frame  frame description
 *  @param image  image description
 *  @param point  point description
 *  @param redius redius description
 *
 *  @return return value description
 */
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame withImage:(UIImage *)image  withCornerRedius:(CGFloat)redius;

/**
 *  创建button
 *
 *  @param frame         frame description
 *  @param type          type description
 *  @param color         color description
 *  @param title         title description
 *  @param normal        normal description
 *  @param highlighted   highlighted description
 *  @param target        target description
 *  @param action        action description
 *  @param contorlevents contorlevents description
 *
 *  @return return value description
 */
+ (UIButton *)createButtonWithFrame:(CGRect)frame withButtonType:(UIButtonType)type withColor:(UIColor *)color withTitle:(NSString *)title  withNormalImage:(UIImage *)normal withHighlightedImage:(UIImage *)highlighted withSelctedImage:(UIImage *)selceted withTarget:(nullable id)target withAction:(nonnull SEL)action withControlEvents:(UIControlEvents)contorlevents withCornerRadius:(CGFloat)radius;





/**
 *  创建textfield
 *
 *  @param frame       frame description
 *  @param placeholder placeholder description
 *  @param delegate    delegate description
 *  @param mode        mode description
 *  @param alignment   alignment description
 *  @param tag         tag description
 *  @param color       color description
 *
 *  @return return value description
 */


+ (UITextField *)createTextFieldWithFrame:(CGRect)frame withPlaceholder:(NSString *)placeholder withDelegate:(nullable id<UITextFieldDelegate>)delegate withClearButtonMode:(UITextFieldViewMode)mode withTextAlignment:(NSTextAlignment)alignment withTag:(NSInteger)tag withBackgroundColor:(UIColor *)color;


/**
 *  创建tableview
 *
 *  @param frame      frame description
 *  @param style      style description
 *  @param delegate   delegate description
 *  @param source     source description
 *  @param color      color description
 *  @param horizontal horizontal description
 *  @param vertical   vertical description
 *  @param scroll     scroll description
 *
 *  @return return value description
 */
+ (UITableView *)createTableViewWithFrame:(CGRect)frame withStyle:(UITableViewStyle)style withDelegate:(nullable id <UITableViewDelegate>)delegate withDataSource:(nullable id <UITableViewDataSource>)source withBackgroundColor:(UIColor *)color withShowsHorizontalScrollIndicator:(BOOL)horizontal withShowsVerticalScrollIndicator:(BOOL)vertical withScrollEnabled:(BOOL)scroll;

/**
 *  创建collectioneview
 *
 *  @param frame      frame description
 *  @param layout     layout description
 *  @param delegate   delegate description
 *  @param dateSource dateSource description
 *  @param color      color description
 *
 *  @return return value description
 */

+ (UICollectionView *)createCollectionViewWithFrame:(CGRect)frame withCollectionViewLayout:(UICollectionViewLayout *)layout withDelegate:(id <UICollectionViewDelegate>)delgate withDateSource:(id <UICollectionViewDataSource>)dateSource witBbackgroundColor:(UIColor *)color;
/**
 *  创建segmentedcontrol
 *
 *  @param frame     frame description
 *  @param array     array description
 *  @param target    target description
 *  @param action    action description
 *  @param control   control description
 *  @param index     index description
 *  @param color     color description
 *  @param backColor backColor description
 *
 *  @return return value description
 */
+ (UISegmentedControl *)createSegmentedControlWithFrame:(CGRect)frame withItemsArray:(NSArray *)array addTarget:(nullable id)target action:(nonnull SEL)action forControlEvents:(UIControlEvents)control withSelectedSegmentIndex:(NSInteger)index withTintColor:(UIColor *)color withBackgroundColor:(UIColor *)backColor;


/**
 *  创建view
 *
 *  @param frame frame description
 *  @param color color description
 *
 *  @return return value description
 */
+ (nullable UIView *)createViewWithFrame:(CGRect)frame withBackgroundColor:(nonnull UIColor *)color;


/**
 *  创建scrollview
 *
 *  @param frame    frame description
 *  @param hori     hori description
 *  @param vert     vert description
 *  @param delegate delegate description
 *
 *  @return return value description
 */
+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame showsHorizontalScrollIndicator:(BOOL)hori showsVerticalScrollIndicator:(BOOL)vert delgate:(id <UIScrollViewDelegate>)delegate;




/**
 *  创建时间选择器
 *
 *  @return return value description
 */

+ (UIView *)createDatePickerView;

/**
 *  创建单选框
 *
 *  @param frame   frame description
 *  @param target  target description
 *  @param action  action description
 *  @param control control description
 *
 *  @return return value description
 */
+ (UIButton *)createCheckBoxViewWithFrame:(CGRect)frame withTarget:(nullable id)target action:(nonnull SEL)action forControlEvents:(UIControlEvents)control;

/**
 *  放大图片
 *
 *  @param avatarImageView avatarImageView description
 */


+(void)showImage:(UIScrollView *)scorllView;


/**
 *  判断两个日期大小
 *
 *  @param date1 date1 description
 *  @param date2 date2 description
 *
 *  @return return value description
 */
+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2;

/**
 *  网络请求
 *
 *  @param url       url description
 *  @param parameter parameter description
 *  @param view      view description
 *  @param success   success description
 *  @param failure   head foot nil
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)parameter isNewFormat:(BOOL)format withView:(UIScrollView *)view success:(void (^)(id data))success failure:(void (^)(NSError *error))failure;


/**
 检测是否为纯数字
 
 @param string string description
 
 @return return value description
 */
+ (BOOL)isStringWhetherToNumber:(NSString *)string;

/**
 检测是否为数字+.
 
 @param string string description
 
 @return return value description
 */
+ (BOOL)isStringWhetherToNumberAndDecimal:(NSString *)string;


@end
