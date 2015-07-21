//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Gang Wu on 7/18/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
// readwrite is for private use
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic) NSUInteger countOfFliped;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(NSMutableArray *)history {
    if (!_history) _history = [[NSMutableArray alloc] init];
    return _history;
}

-(instancetype)init{
    return nil;
}

-(instancetype)initWithCardCount:(NSUInteger)count
                         andMode:(NSUInteger)mode
                       usingDeck:(Deck *)deck{
    self = [super init];
    
    if (self) {
        self.countOfFliped = 0;
        self.numberOfMode = mode;
        [self.history removeAllObjects];
        for (int i = 0; i < count; ++i) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index{
    Card * card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            self.countOfFliped++;
            if (self.countOfFliped == self.numberOfMode) {
                NSMutableArray *chosenAndNoneMatchedCard = [[NSMutableArray alloc] init];
                NSMutableString *message = [[NSMutableString alloc] initWithString:card.contents];
                
                for (Card *otherCard in self.cards) {
                    if (otherCard.isChosen && !otherCard.isMatched) {
                        [chosenAndNoneMatchedCard addObject:otherCard];
                        [message appendString:@", "];
                        [message appendString:otherCard.contents];
                    }
                }
                
                int matchScore = [card match:[chosenAndNoneMatchedCard copy]];
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    for (Card *otherCard in chosenAndNoneMatchedCard){
                        otherCard.chosen = YES;
                        otherCard.matched = YES;
                    }
                    card.matched = YES;
                    self.countOfFliped = 0;
                    
                    [message appendString:@" are matched!"];
                } else {
                    self.score -= MISMATCH_PENALTY;
                    for (Card *otherCard in chosenAndNoneMatchedCard){
                        otherCard.chosen = NO;
                    }
                    self.countOfFliped = 1;
                    [message appendString:@" are mismatched!"];
                }
                
                [self.history addObject:message];
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end
