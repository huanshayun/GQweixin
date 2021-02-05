//
//  GQContactGroup.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/4.
//

#import <Foundation/Foundation.h>
#import "GQContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface GQContactGroup : NSObject

@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, strong) NSMutableArray *groupMembers;
@property (nonatomic) NSInteger membersCount;
@property (nonatomic) NSInteger indexTag;

- (instancetype)initWithGroupName:(NSString *)groupName groupMembers:(NSMutableArray *)groupMembers;
- (void)addMember:(GQContact *)contact;
- (id)memberAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
