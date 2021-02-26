//
//  GQContactDetailBaseInfoCellCollectionViewCell.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/23.
//
//  显示联系人的基本信息

#import <UIKit/UIKit.h>
#import "GQContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface GQContactDetailBaseInfoCell : UITableViewCell
//联系人数据模型
@property (nonatomic, strong) GQContact *contactModel;

//行高
+ (CGFloat)viewCellHeight;

@end

NS_ASSUME_NONNULL_END
