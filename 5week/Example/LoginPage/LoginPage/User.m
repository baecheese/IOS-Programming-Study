//
//  User.m
//  LoginPage
//
//  Created by 배지영 on 2016. 6. 6..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "User.h"

@implementation User

/* 데이터 센터에 유저 정보 저장 */
- (instancetype)initWithUser:(NSString *)userID userPW:(NSString *)userPW
{
    self = [super init];
    if (self) {
        self.userID = userID;
        self.userPW = userPW;
    }
    return self;
}

@end
