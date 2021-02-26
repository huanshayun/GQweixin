//
//  GQContactManage.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/4.
//
//  联系人管理（读取，排序，分组）

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
        self.contactsData = [[NSMutableArray alloc] init];
        self.contactsIndex = [[NSMutableArray alloc] init];
        self.contactsDataWithoutGroup = [[NSMutableArray alloc] init];
        
        //读取联系人信息列表
        NSString *contactsDataPath = [[NSBundle mainBundle] pathForResource:@"FriendList" ofType:@"json"];
        NSData *contactsJsonData = [NSData dataWithContentsOfFile:contactsDataPath];
        NSArray *contactsJsonArray = [NSJSONSerialization JSONObjectWithData:contactsJsonData options:NSJSONReadingAllowFragments error:nil];
        
        //建立联系人模型，并保存数据
        for(NSDictionary *d in contactsJsonArray){
            NSString *cName = [d objectForKey:@"userName"];
            NSString *cIconName = [d objectForKey:@"imageName"];
            NSString *cID = [d objectForKey:@"userID"];
            GQContact *contact = [GQContact initWithName:cName wxid:cID image:cIconName];
            
            contact.remarkName = [d objectForKey:@"remarkName"];
            NSDictionary *cDetail = [d objectForKey:@"userDetail"];
            [contact.userDetail setUserDetail:cDetail];
            
            [self.contactsDataWithoutGroup addObject:contact];
        }
        
        [self resetContactsData];
    }
    return self;
}

- (void)resetContactsData{
    //根据联系人展示名的拼音进行字典序排列
    NSArray *sortedContactsData = [self.contactsDataWithoutGroup sortedArrayUsingComparator:^NSComparisonResult(id user1, id user2){
        int i;
        NSString *strA = ((GQContact *)user1).pinyin;
        NSString *strB = ((GQContact *)user2).pinyin;
        for (i = 0; i < strA.length && i < strB.length; i++) {
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
    
    
    //根据拼音分组
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
        if (!isalpha(c)) {  //非字母
            [otherGroup addMember:contact];
        }
        else if (c != lastC){ //非当前分组
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
        else { //当前分组
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
    
    //保存有序的联系人数据
    [self.contactsData removeAllObjects];
    [self.contactsData addObjectsFromArray:ansData];
    [self.contactsIndex removeAllObjects];
    [self.contactsIndex addObjectsFromArray:ansIndex];
}

// 获取联系人数目
- (NSInteger)contactsCount{
    return self.contactsDataWithoutGroup.count;
}

// 根据联系人id获取联系人数据模型
- (GQContact *)getContactInfo:(NSString *)userID{
    if(userID == nil)
        return nil;
    for(GQContact *contact in self.contactsDataWithoutGroup){
        if([contact.userID isEqualToString:userID]){
            return contact;
        }
    }
    return nil;
}

@end
