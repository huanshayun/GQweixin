//
//  GQContactDetailAlbumCell.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/26.
//
//  显示联系人的相册

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GQContactDetailAlbumCell : UITableViewCell

//行高
+ (CGFloat)viewCellHeight;
//保存标题和相册信息
- (void)setTitleText:(NSString *)titleText album:(NSArray *)album;

@end

NS_ASSUME_NONNULL_END
