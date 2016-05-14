//
//  CardClass.m
//  CardDock
//
//  Created by 배지영 on 2016. 5. 12..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "Card.h"

@implementation Card

{
    NSString *_cardType;
    NSString *_cardNumber;
    NSString *_cardColor;
}

- (instancetype)initWithCard: (NSString *)type setingCardNumber:(NSString *)num
{
    self = [super init];
    if (self) {
        _cardType = type;
        _cardNumber = num;
        _cardColor = [self getColor:type];
    }
    return self;
}

-(NSString *) getColor:(NSString *) cardType
{
    if ([cardType isEqual: @"♦️"] || [cardType  isEqual: @"❤️"])
    {
        return @"red";
    }
    else
    {
        return @"black";
    }
    
}

-(void) print
{
    NSLog(@"%@, %@, %@", _cardColor, _cardType, _cardNumber);

}

@end
