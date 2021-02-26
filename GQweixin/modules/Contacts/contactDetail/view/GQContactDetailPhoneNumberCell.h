//
//  GQContactDetailPhoneNumberCell.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/25.
//
//  显示联系人的手机号信息

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GQContactDetailPhoneNumberCell : UITableViewCell

//行高
+ (CGFloat)viewCellHeight;
//保存联系人的手机号
- (void)setTitleText:(NSString *)titleText phoneNumber:(NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END
