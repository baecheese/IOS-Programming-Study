//
//  Casher.h
//  VendingMachine
//
//  Created by 배지영 on 2016. 5. 13..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "DrinkObject.h"
#import <Foundation/Foundation.h>

@interface Casher : NSObject


//동전 추가 메소드
-(void)addCoin500;
-(void)addCoin100;
-(NSInteger)inputMoney;

@property (nonatomic, readonly) NSInteger inputMoney;

//음료수 사는 메소드
-(BOOL)buyDrink:(DrinkObject *)drink;

//돈 거슬러줄 (동전 list)
//{@"500":count, @"100":count}
-(NSDictionary *)changeMoney;

@end
