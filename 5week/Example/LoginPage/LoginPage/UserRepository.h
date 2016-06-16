//
//  UserRepository.h
//  LoginPage
//
//  Created by 배지영 on 2016. 6. 6..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserRepository : NSObject

- (User *) findByUserId:(NSString *)userId;
- (NSArray<User *> *) findAllByUserIds:(NSArray *) userIds;
- (void) save:(User *) user;
- (void) saveAll:(NSArray<User *> *) users;

@end
