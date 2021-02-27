//
//  GQContactDetailButtonCell.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/27.
//
//  显示功能区控件

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GQContactDetailButtonCell : UITableViewCell

//行高
+ (CGFloat)viewCellHeight;
//保存控件标题
- (void)setTitleText:(NSString *)titleText;

@end

NS_ASSUME_NONNULL_END
