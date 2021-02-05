//
//  GQContactHeaderView.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GQContactHeaderView : UITableViewHeaderFooterView

@property(nonatomic, strong) NSString *title;

+ (CGFloat)viewHeaderHeight;

- (void)setViewTitle:(id)data;

@end

NS_ASSUME_NONNULL_END
