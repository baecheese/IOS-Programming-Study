//
//  CardClass.h
//  CardDock
//
//  Created by 배지영 on 2016. 5. 12..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Card : NSObject

- (instancetype) initWithCard: (NSString *)type setingCardNumber:(NSString *)num;
- (void) print;

@end
