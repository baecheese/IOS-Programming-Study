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

-(NSMutableDictionary *)selectDataByKey:(NSString *) dataKey fileName:(NSString *) fileName;
-(void)addData:(NSDictionary *)data dataKey:(NSString *)dataKey fileName:(NSString *)fileName;

@end
