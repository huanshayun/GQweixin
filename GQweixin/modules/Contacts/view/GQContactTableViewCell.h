//
//  GQContactTableViewCell.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/1/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class GQContact;

@interface GQContactTableViewCell : UITableViewCell

@property(nonatomic, strong) GQContact *contactModel;
+ (CGFloat)viewCellHeight;

@end

NS_ASSUME_NONNULL_END
