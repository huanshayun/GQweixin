//
//  GQContact.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/1/28.
//

#import <Foundation/Foundation.h>
#import "GQContactDetail.h"

NS_ASSUME_NONNULL_BEGIN

@interface GQContact : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *userIcon;
@property (nonatomic, copy) NSString *remarkName;
@property (nonatomic, copy) NSString *showName;

#pragma user-detail
@property (nonatomic, copy) GQContactDetail *userDetail;

@property (nonatomic, copy) NSString *pinyin;
@property (nonatomic, copy) NSString *pinyinInitial;

- (GQContact *)initWithName:(NSString *)name wxid:(NSString *)ID image:(NSString *)imageName;
+ (GQContact *)initWithName:(NSString *)name wxid:(NSString *)ID image:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
