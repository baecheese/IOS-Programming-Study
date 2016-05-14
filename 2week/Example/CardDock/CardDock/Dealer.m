//
//  DealerClass.m
//  CardDock
//
//  Created by 배지영 on 2016. 5. 12..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "Card.h"
#import "Dealer.h"

@implementation Dealer
{
    NSMutableArray *cardDeck;
}

//(createDeck, shuffleDeck, printDeck(type,number,color출력))

-(void) createDeck
{
    //nill초기화
    [self exceptionInit];
    
    //본론
    NSArray *cardType = @[@"♦️",@"❤️",@"♣️",@"♠️"];
    NSArray *cardNum = @[@"a",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"j",@"q",@"k"];
    
    
    for (int cType=0; cType<4; cType++)
    {
        for (int cNum=0; cNum < 13; cNum++)
        {
            //초기화 및 객체 삽입
            [cardDeck addObject: [[Card alloc] initWithCard:cardType[cType] setingCardNumber:cardNum[cNum]]];
        }
    }
    
    NSLog(@"cardDeck: %ld", cardDeck.count);//52개
//    return *cardDeck;
}

-(void)shuffleDeck
{
    Card *tempArrayOne;
    Card *tempArrayTwo;
    int tempNum;
    
    //52번 촥촥
    for (int i=0; i<51; i++)
    {
        // 순서대로 뽑고
        tempArrayOne = cardDeck[i];
        
        
        //랜덤 숫자로 뽑고
        tempNum = arc4random()%52;
        tempArrayTwo = cardDeck[tempNum];
        
        // 바꾼다
        cardDeck[i] = tempArrayTwo;
        cardDeck[tempNum] = tempArrayOne;
    }

    NSLog(@"cardDeck: %@", cardDeck[48]);
    
}


-(void)printDeck
{
    for (Card *card in cardDeck)
    {
        [card print];
    }
}

-(void)exceptionInit
{
    //예외처리 초기화
    if (cardDeck == nil)
    {
        cardDeck = [[NSMutableArray alloc] initWithCapacity:1];
    }
}


@end
