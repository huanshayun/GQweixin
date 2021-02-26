//
//  GQContactDetailViewController.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/23.
//
//

#import <UIKit/UIKit.h>
#import "GQContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface GQContactDetailViewController : UITableViewController

- (instancetype)initWithUserID:(NSString *)userID;
- (instancetype)initWithUserModel:(GQContact *)contactModel;

@end

NS_ASSUME_NONNULL_END
