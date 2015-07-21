//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Gang Wu on 7/20/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype)init{
    self = [super init];
    
    if (self){
        for (NSString *symbol in [SetCard validSymbols]){
            for (NSString *shading in [SetCard validShadings]) {
                for (NSString *color in [SetCard validColors]) {
                    for (NSUInteger number = 1; number <= [SetCard maxNumber]; number++){
                        SetCard *card = [[SetCard alloc] init];
                        card.number = number;
                        card.symbol = symbol;
                        card.color = color;
                        card.shading = shading;
                        [self addCard:card];
                    }

                }
            }
        }
    }
    
    return self;
}

@end
