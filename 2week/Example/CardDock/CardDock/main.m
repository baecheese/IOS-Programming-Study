//
//  main.m
//  CardDock
//
//  Created by 배지영 on 2016. 5. 12..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Dealer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Dealer *dealer = [[Dealer alloc]init];
        
        [dealer createDeck];
        [dealer shuffleDeck];
        [dealer printDeck];
        
    }
    return 0;
}
