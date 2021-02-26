//
//  GQContactDetail.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/3.
//
//  联系人详细信息

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GQContactDetail : NSObject

//微信id
@property (nonatomic, strong) NSString *userID;
//位置
@property (nonatomic, strong) NSString *location;
//电话号码
@property (nonatomic, strong) NSString *phoneNumber;
//qq号码
@property (nonatomic, strong) NSString *qqNumber;
//电子邮箱
@property (nonatomic, strong) NSString *email;
//性别
@property (nonatomic, strong) NSString *sex;
//标签
@property (nonatomic, strong) NSMutableArray *tags;
//相册
@property (nonatomic, strong) NSMutableArray *albums;

#pragma user-setting
//（联系人）是否置顶
@property (nonatomic) BOOL isTop;
//是否免打扰
@property (nonatomic) BOOL noDisturb;
//是否在黑名单中
@property (nonatomic) BOOL blacklist;
//是否是星标朋友
@property (nonatomic) BOOL star;


- (void)setUserDetail:(NSDictionary *)dataDict;

@end

NS_ASSUME_NONNULL_END
