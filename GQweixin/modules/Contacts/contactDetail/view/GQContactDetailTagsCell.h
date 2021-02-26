//
//  GQContactDetailTagsCell.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/25.
//
//  显示联系人的标签和备注信息

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GQContactDetailTagsCell : UITableViewCell

//行高
+ (CGFloat)viewCellHeight;
//保存内容
- (void)setTitleText:(NSString *)titleText tags:(NSArray *)tags;

@end

NS_ASSUME_NONNULL_END
