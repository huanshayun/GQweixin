//
//  GQContactDetail.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/3.
//
//  联系人详细信息

#import "GQContactDetail.h"

@implementation GQContactDetail

//保存联系人详细信息
- (void)setUserDetail:(NSDictionary *)dataDict{
    self.location = [dataDict objectForKey:@"location"];
    self.phoneNumber = [dataDict objectForKey:@"phoneNumber"];
    self.qqNumber = [dataDict objectForKey:@"qqNumber"];
    self.sex = [dataDict objectForKey:@"sex"];
    self.email = [dataDict objectForKey:@"email"];
    self.tags = [dataDict objectForKey:@"tags"];
    self.albums = [dataDict objectForKey:@"albums"];
    self.isTop = [dataDict objectForKey:@"isTop"];
    self.blacklist = [dataDict objectForKey:@"blacklist"];
    self.noDisturb = [dataDict objectForKey:@"noDisturb"];
    self.star = [dataDict objectForKey:@"star"];
}
@end
