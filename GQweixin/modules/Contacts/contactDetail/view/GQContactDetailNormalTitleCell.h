//
//  GQContactDetailNormalTitleCell.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/25.
//
//  显示联系人的普通标题

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GQContactDetailNormalTitleCell : UITableViewCell

//行高
+ (CGFloat)viewCellHeight;
//保存标题信息
- (void)setTitleText:(NSString *)titleText;

@end

NS_ASSUME_NONNULL_END
