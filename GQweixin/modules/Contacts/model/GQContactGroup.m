//
//  GQContactGroup.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/4.
//
//  联系人分组（按“展示名”字典序）

#import "GQContactGroup.h"

//初始化
@implementation GQContactGroup
- (instancetype)initWithGroupName:(NSString *)groupName groupMembers:(NSMutableArray *)groupMembers{
    if(self = [super init]){
        self.groupName = groupName;
        self.groupMembers = groupMembers;
    }
    return self;
}

- (NSMutableArray *)groupMembers{
    if(_groupMembers == nil){
        _groupMembers = [[NSMutableArray alloc] init];
    }
    return _groupMembers;
}

- (NSInteger)membersCount{
    return self.groupMembers.count;
}

- (void)addMember:(GQContact *)contact{
    [self.groupMembers addObject:contact];
}

- (id)memberAtIndex:(NSUInteger)index{
    return [self.groupMembers objectAtIndex:index];
}

@end
