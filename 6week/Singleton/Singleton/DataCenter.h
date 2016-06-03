//
//  DataCenter.h
//  Singleton
//
//  Created by 배지영 on 2016. 6. 2..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

//싱글톤 변수의 클래스 메소드
+(instancetype)sharedInstance;

@property(nonatomic, strong)NSString *name;
@property(nonatomic, assign)NSInteger age;//왜 strong하면 오류날까
-(void)printData;

@end
