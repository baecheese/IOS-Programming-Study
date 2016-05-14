//
//  TrayBox.h
//  VendingMachine
//
//  Created by 배지영 on 2016. 5. 13..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkObject.h"

static const NSInteger maximumDrinkCount = 4;

@interface TrayBox : NSObject

@property (nonatomic, readonly, strong) NSArray *drinkKinds;

@end
