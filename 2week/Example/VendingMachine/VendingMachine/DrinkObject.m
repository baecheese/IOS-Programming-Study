//
//  DrinkObject.m
//  VendingMachine
//
//  Created by 배지영 on 2016. 5. 13..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "DrinkObject.h"

@implementation DrinkObject

-(instancetype) initWithName:(NSString *)name cost:(NSInteger)cost;
{
    self = [super init];
    if (self) {
        _name = name;
        _cost = cost;
    }
    return self;
}

@end
