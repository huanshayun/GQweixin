//
//  GQContact.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/1/28.
//

#import "GQContact.h"
#import "NSString+PinYin.h"

@implementation GQContact

- (GQContact *)initWithName:(NSString *)name wxid:(NSString *)ID image:(NSString *)imageName{
    if(self = [super init]){
        self.userName = name;
        self.userID = ID;
        self.userIcon = imageName;
        self.remarkName = name;
    }
    return self;
}

+ (GQContact *)initWithName:(NSString *)name wxid:(NSString *)ID image:(NSString *)imageName{
    GQContact *contact = [[GQContact alloc] initWithName:name wxid:ID image:imageName];
    return contact;
}

- (void)setUserName:(NSString *)userName{
    if([self.userName isEqual:userName]){
        return;
    }
    self.userName = userName;
    if(self.remarkName.length == 0 && self.userName.length > 0){
        self.pinyin = userName.pinyin;
        self.pinyinInitial = userName.pinyinInitial;
    }
}

- (void)setRemarkName:(NSString *)remarkName{
    if([self.remarkName isEqual:remarkName]){
        return;
    }
    self.remarkName = remarkName;
    if(self.remarkName.length > 0){
        self.pinyin = remarkName.pinyin;
        self.pinyinInitial = remarkName.pinyinInitial;
    }
}

- (NSString *)showName{
    return self.remarkName.length > 0 ? self.remarkName : self.userName;
}

- (GQContactDetail *)userDetail{
    if(self.userDetail == nil){
        self.userDetail = [[GQContactDetail alloc] init];
    }
    return self;
}

@end
