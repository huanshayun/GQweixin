//
//  GQContact.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/1/28.
//
//  联系人模型

#import "GQContact.h"
#import "NSString+PinYin.h"

@implementation GQContact

//初始化，传入参数为“用户昵称”，“用户头像”，“用户id”
- (GQContact *)initWithName:(NSString *)name wxid:(NSString *)ID image:(NSString *)imageName{
    if(self = [super init]){
        self.userName = name;
        self.userID = ID;
        self.userIcon = imageName;
    }
    return self;
}

+ (GQContact *)initWithName:(NSString *)name wxid:(NSString *)ID image:(NSString *)imageName{
    GQContact *contact = [[GQContact alloc] initWithName:name wxid:ID image:imageName];
    return contact;
}

//保存用户昵称
- (void)setUserName:(NSString *)userName{
    if([_userName isEqual:userName]){
        return;
    }
    _userName = userName;
    if(self.remarkName.length == 0 && self.userName.length > 0){
        self.showName = userName;
        self.pinyin = userName.pinyin;
        self.pinyinInitial = userName.pinyinInitial;
    }
}

//保存用户备注名
- (void)setRemarkName:(NSString *)remarkName{
    if([_remarkName isEqual:remarkName]){
        return;
    }
    _remarkName = remarkName;
    if(self.remarkName.length > 0){
        self.showName = remarkName;
        self.pinyin = remarkName.pinyin;
        self.pinyinInitial = remarkName.pinyinInitial;
    }
}

//获取用户展示名（显示优先级：备注 > 昵称）
- (NSString *)showName{
    return self.remarkName.length > 0 ? self.remarkName : self.userName;
}

//获取用户详细信息
- (GQContactDetail *)userDetail{
    if(_userDetail == nil){
        _userDetail = [[GQContactDetail alloc] init];
    }
    return _userDetail;
}

@end
