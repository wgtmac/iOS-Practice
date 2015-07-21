//
//  SetCard.h
//  Matchismo
//
//  Created by Gang Wu on 7/20/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSUInteger number;
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *shading;

+ (NSArray *)validSymbols;
+ (NSArray *)validColors;
+ (NSArray *)validShadings;
+ (NSUInteger)maxNumber;

@end
