//
//  Card.m
//  Matchismo
//
//  Created by Gang Wu on 7/17/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards)
    {
        if ([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    
    return score;
}

//-(int)match:(Card *)card
//{
//    int score = 0;
//    
//    if ([card.contents isEqualToString:self.contents]) {
//        score = 1;
//    }
//    
//    return score;
//}



@end
