//
//  GQContactDetailViewController.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/25.
//
//  “联系人详细信息”页面的视图控制器

#import <UIKit/UIKit.h>
#import "GQContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface GQContactDetailViewController : UITableViewController

//使用“用户id”进行初始化
- (instancetype)initWithUserID:(NSString *)userID;
//使用“用户数据模型”进行初始化
- (instancetype)initWithUserModel:(GQContact *)contactModel;

@end

NS_ASSUME_NONNULL_END
