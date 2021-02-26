//
//  GQContactManage.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/4.
//
//  联系人管理（读取，排序，分组）

#import <Foundation/Foundation.h>
#import "GQContact.h"
#import "GQContactGroup.h"

NS_ASSUME_NONNULL_BEGIN

@interface GQContactManage : NSObject

//联系人数据
@property (nonatomic, strong) NSMutableArray *contactsData;
//
@property (nonatomic, strong) NSMutableArray *contactsDataWithoutGroup;
//联系人索引
@property (nonatomic, strong) NSMutableArray *contactsIndex;
//联系人数量
@property (nonatomic) NSInteger contactsCount;

//初始化
+ (GQContactManage *)contactManage;
//获取联系人信息
- (GQContact *)getContactInfo:(NSString *)userID;

@end

NS_ASSUME_NONNULL_END
