//
//  GQContact.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/1/28.
//
//  联系人模型

#import <Foundation/Foundation.h>
#import "GQContactDetail.h"

NS_ASSUME_NONNULL_BEGIN

@interface GQContact : NSObject

//用户昵称，注意使用copy修饰
@property (nonatomic, strong) NSString *userName;
//用户微信id
@property (nonatomic, strong) NSString *userID;
//用户头像
@property (nonatomic, strong) NSString *userIcon;
//用户备注名
@property (nonatomic, strong) NSString *remarkName;
//用户展示名
@property (nonatomic, strong) NSString *showName;

#pragma user-detail
//用户详细信息
@property (nonatomic, strong) GQContactDetail *userDetail;

//用户展示名的拼音
@property (nonatomic, strong) NSString *pinyin;
//用户展示名的拼音首字母
@property (nonatomic, strong) NSString *pinyinInitial;

- (GQContact *)initWithName:(NSString *)name wxid:(NSString *)ID image:(NSString *)imageName;
+ (GQContact *)initWithName:(NSString *)name wxid:(NSString *)ID image:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
