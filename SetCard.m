//
//  SetCard.m
//  Matchismo
//
//  Created by Gang Wu on 7/20/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (SetCard *otherCard in otherCards) {
        if (otherCard.number == self.number) {
            score += 1;
        }
        if ([otherCard.symbol isEqualToString:self.symbol]) {
            score += 1;
        }
        if ([otherCard.color isEqualToString:self.color]) {
            score += 1;
        }
        if ([otherCard.shading isEqualToString:self.shading]) {
            score += 1;
        }
    }
    
    return score;
}

- (NSString *)contents
{
    return @"Something";
}

@synthesize shading = _shading;
@synthesize color = _color;
@synthesize symbol = _symbol;

+ (NSArray *)validSymbols{
    return @[@"▲", @"●", @"■"];
}

+ (NSArray *)validColors{
    return @[@"Red", @"Green", @"Purple"];
}

+ (NSArray *)validShadings{
    return @[@"Solid", @"Striped", @"Open"];
}

// private
+ (NSArray *)numberStrings{
    return @[@"?", @"1", @"2", @"3"];
}

-(void)setColor:(NSString *)color{
    if ([[SetCard validColors] containsObject: color]){
        _color = color;
    }
}

-(void)setShading:(NSString *)shading{
    if ([[SetCard validShadings] containsObject: shading]){
        _shading = shading;
    }
}

-(void)setSymbol:(NSString *)symbol{
    if ([[SetCard validSymbols] containsObject: symbol]){
        _symbol = symbol;
    }
}

-(NSString *)shading {
    return _shading ? _shading : @"?";
}

-(NSString *)symbol{
    return _symbol ? _symbol : @"?";
}

-(NSString *)color{
    return _color ? _color : @"?";
}

+(NSUInteger)maxNumber { return [[self numberStrings] count] - 1;}

- (void)setNumber:(NSUInteger)number{
    if (number <= [SetCard maxNumber]){
        _number = number;
    }
}

@end
