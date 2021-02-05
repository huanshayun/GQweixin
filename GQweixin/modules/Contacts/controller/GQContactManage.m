//
//  GQContactManage.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/4.
//

#import "GQContactManage.h"
#import <UIKit/UIKit.h>

static GQContactManage *contactManage = nil;
@implementation GQContactManage

+ (GQContactManage *)contactManage{
    contactManage = [[GQContactManage alloc] init];
    return contactManage;
}

- (instancetype)init{
    if(self = [super init]){
        NSString *contactsDataPath = [[NSBundle mainBundle] pathForResource:@"FriendList" ofType:@"json"];
        NSData *contactsJsonData = [NSData dataWithContentsOfFile:contactsDataPath];
        NSArray *contactsJsonArray = [NSJSONSerialization JSONObjectWithData:contactsJsonData options:NSJSONReadingAllowFragments error:nil];
        
        [self.contactsData removeAllObjects];
        for(NSDictionary *d in contactsJsonArray){
            NSString *cName = [d objectForKey:@"username"];
            NSString *cIconName = [d objectForKey:@"imagepath"];
            NSString *cID = [d objectForKey:@"userID"];
            GQContact *contact = [GQContact initWithName:cName wxid:cID image:cIconName];
            
            contact.remarkName = [d objectForKey:@"remarkname"];
            NSDictionary *cDetail = [d objectForKey:@"userdetail"];
            [contact.userDetail setUserDetail:cDetail];
            
            [self.contactsData addObject:contact];
        }
        [self resetContactsData];
    }
    return self;
}

- (void)resetContactsData{
    //sorted by pinyin
    NSArray *sortedContactsData = [self.contactsData sortedArrayUsingComparator:^NSComparisonResult(id user1, id user2){
        int i;
        NSString *strA = ((GQContact *)user1).pinyin;
        NSString *strB = ((GQContact *)user2).pinyin;
        for (i = 0; i < strA.length && i < strB.length; i ++) {
            char a = toupper([strA characterAtIndex:i]);
            char b = toupper([strB characterAtIndex:i]);
            if (a > b) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            else if (a < b) {
                return (NSComparisonResult)NSOrderedAscending;
            }
        }
        if (strA.length > strB.length) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        else if (strA.length < strB.length){
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
                                   
    NSMutableArray *ansData = [[NSMutableArray alloc] init];
    NSMutableArray *ansIndex = [[NSMutableArray alloc] initWithObjects:UITableViewIndexSearch, nil];
    //NSMutableDictionary *tagsDic = [[NSMutableDictionary alloc] init];
    char lastC = '1';
    GQContactGroup *curGroup;
    GQContactGroup *otherGroup = [[GQContactGroup alloc] init];
    [otherGroup setGroupName:@"#"];
    [otherGroup setIndexTag:(NSInteger)27];
    for (GQContact *contact in sortedContactsData) {
        // 获取拼音失败
        if (contact.pinyin == nil || contact.pinyin.length == 0) {
           [otherGroup addMember:contact];
           continue;
        }
        char c = toupper([contact.pinyin characterAtIndex:0]);
            if (!isalpha(c)) {      
                [otherGroup addMember:contact];
            }
            else if (c != lastC){
                if (curGroup && curGroup.membersCount > 0) {
                    [ansData addObject:curGroup];
                    [ansIndex addObject:curGroup.groupName];
                }
                lastC = c;
                curGroup = [[GQContactGroup alloc] init];
                [curGroup setGroupName:[NSString stringWithFormat:@"%c", c]];
                [curGroup addMember:contact];
                [curGroup setIndexTag:(NSInteger)c];
            }
            else {
                [curGroup addMember:contact];
            }
    }
    if (curGroup && curGroup.membersCount > 0) {
        [ansData addObject:curGroup];
        [ansIndex addObject:curGroup.groupName];
    }
    if (otherGroup.membersCount > 0){
        [ansData addObject:otherGroup];
        [ansIndex addObject:otherGroup.groupName];
    }
    
    [self.contactsData removeAllObjects];
    [self.contactsData addObjectsFromArray:ansData];
    [self.contactsIndex removeAllObjects];
    [self.contactsIndex addObjectsFromArray:ansIndex];
}
@end
