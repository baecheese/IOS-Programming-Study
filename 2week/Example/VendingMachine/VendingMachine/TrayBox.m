//
//  TrayBox.m
//  VendingMachine
//
//  Created by 배지영 on 2016. 5. 13..
//  Copyright © 2016년 baecheese. All rights reserved.
//

//#import "DrinkObject.h"
#import "TrayBox.h"

@interface TrayBox()

@property (nonatomic, nullable) NSArray *nameList;
@property (nonatomic, nullable) NSArray *costList;
@property (nonatomic) NSArray *drinkKinds;

@end

@implementation TrayBox

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nameList = @[@"iphone", @"ipad", @"imac", @"macbook"];
        self.costList = @[@"500", @"1000", @"2000", @"1000"];
        [self creatTray];
    }
    return self;
}

-(void)creatTray
{
    NSMutableArray *drinkList = [[NSMutableArray alloc]init];
    for (int i=0; i<maximumDrinkCount; i++) {
        NSString *drinkName = _nameList[i];
        NSInteger drinkCost = ((NSNumber *)_costList[i]).integerValue;
        DrinkObject *drink = [[DrinkObject alloc]initWithName:drinkName cost:drinkCost];
        [drinkList addObject:drink];
    }
    self.drinkKinds = [[NSArray alloc]initWithArray:drinkList];
}

@end
