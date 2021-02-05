//
//  GQContactManage.h
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/4.
//

#import <Foundation/Foundation.h>
#import "GQContact.h"
#import "GQContactGroup.h"

NS_ASSUME_NONNULL_BEGIN

@interface GQContactManage : NSObject

@property (nonatomic, strong) NSMutableArray *contactsData;
@property (nonatomic, strong) NSMutableArray *contactsIndex;
@property (nonatomic) NSInteger *contactsCount;

+ (GQContactManage *)contactManage;
- (GQContact *)getContactInfo:(NSString *)userID;

@end

NS_ASSUME_NONNULL_END
