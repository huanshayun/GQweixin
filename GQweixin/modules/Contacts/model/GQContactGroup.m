//
//  GQContactGroup.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/4.
//

#import "GQContactGroup.h"

@implementation GQContactGroup
- (instancetype)initWithGroupName:(NSString *)groupName groupMembers:(NSMutableArray *)groupMembers{
    if(self = [super init]){
        self.groupName = groupName;
        self.groupMembers = groupMembers;
    }
    return self;
}

- (NSInteger)count{
    return self.groupMembers.count;
}

- (void)addMember:(GQContact *)contact{
    [self.groupMembers addObject:contact];
}

- (id)memberAtIndex:(NSUInteger)index{
    return [self.groupMembers objectAtIndex:index];
}

@end
