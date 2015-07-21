//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Gang Wu on 7/18/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count andMode:(NSUInteger)mode usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

// no public setter
// private setter is still valid
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSUInteger numberOfMode;
@property (nonatomic, strong) NSMutableArray *history;


@end
