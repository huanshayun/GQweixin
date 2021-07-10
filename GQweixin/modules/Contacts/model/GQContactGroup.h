//
//  GQContactGroup.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/4.
//
//  联系人分组（按“展示名”字典序）

#import <Foundation/Foundation.h>
#import "GQContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface GQContactGroup : NSObject

//分组名
@property (nonatomic, strong) NSString *groupName;
//组内联系人成员
@property (nonatomic, strong) NSMutableArray *groupMembers;
//组内人数，assign修饰
@property (nonatomic) NSInteger membersCount;
//索引
@property (nonatomic) NSInteger indexTag;

//初始化分组
- (instancetype)initWithGroupName:(NSString *)groupName groupMembers:(NSMutableArray *)groupMembers;
//添加联系人入组
- (void)addMember:(GQContact *)contact;
//获取索引位置的联系人
- (id)memberAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
