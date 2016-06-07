//
//  User.h
//  LoginPage
//
//  Created by 배지영 on 2016. 6. 6..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userPW;

- (instancetype)initWithUser:(NSString *)userID userPW:(NSString *)userPW;
- (BOOL)isEqualPassword:(NSString *) password;
- (BOOL)isNotEqualPassword:(NSString *) password;

@end
