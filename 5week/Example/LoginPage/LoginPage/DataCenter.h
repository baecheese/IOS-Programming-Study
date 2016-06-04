//
//  DataCenter.h
//  LoginPage
//
//  Created by 배지영 on 2016. 6. 3..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype)sharedInstance;

-(NSMutableDictionary *)callUserInformation;
-(NSMutableDictionary *)findByUserId:(NSString *)userID;
-(void)addUserInformation:(NSString *)userID userPW:(NSString *)userPW;

@end
