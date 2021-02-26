//
//  GQContactTableViewCell.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/1/28.
//
//  设置联系人tableviewCell的视图

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GQContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface GQContactTableViewCell : UITableViewCell

@property(nonatomic, strong) GQContact *contactModel;

+ (CGFloat)viewCellHeight;

@end

NS_ASSUME_NONNULL_END
