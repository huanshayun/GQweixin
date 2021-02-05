//
//  GQContactDetail.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GQContactDetail : NSObject

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *qqNumber;
@property (nonatomic, copy) NSString *remarkName;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *personalSign;
@property (nonatomic, copy) NSMutableArray *tags;

@property (nonatomic) BOOL isTop;
@property (nonatomic) BOOL noDisturb;

@property (nonatomic) BOOL blacklist;
@property (nonatomic) BOOL star;

- (void)setUserDetail:(NSDictionary *)dataDict;

@end

NS_ASSUME_NONNULL_END
