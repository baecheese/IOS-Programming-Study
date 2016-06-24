//
//  RequstObject.h
//  NetworkProject
//
//  Created by 배지영 on 2016. 6. 24..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequstObject : NSObject

@property (nonatomic, weak) NSString *userID;

+(instancetype)shareInstance;
-(void)uploadImage:(UIImage *)image title:(NSString *)title;

@end
